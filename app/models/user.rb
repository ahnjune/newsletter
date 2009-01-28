require 'digest/sha1'

class User < ActiveRecord::Base
  
  acts_as_taggable
  
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  has_many :assigned_areas, :as => "owner", :dependent => :destroy
  has_many :areas, :through => :assigned_areas

  has_many :recommendations, :dependent => :destroy

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  validates_presence_of :first_name
  validates_presence_of :last_name

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation, :first_name, :last_name, :birthday, :gender, :occupation, :area_ids

  named_scope :ordered, lambda { |*sym| { :order => (sym.first || :email )}}
  named_scope :recommended_before, lambda { |date| { :conditions => ["recommendations_generated_at IS NULL or recommendations_generated_at < ?", date] } }

  def can_add_more_tags?
    tag_list.length < 10
  end

  def clear_recommendations
    recommendations.clear
    update_attribute :recommendations_generated_at, nil
  end

  def can_generate_recommendations?
    not needs_more_tags?
  end

  def needs_more_tags?
    tag_list.length < 3
  end

  # create any recommendations based on relevant FeedItems and AmazonTitles 
  # that have not already been recommended.
  # returns the new recommendations
  def generate_recommendations
    return unless can_generate_recommendations?
    logger.info "Generating recommendations for #{name}"
    returning([]) do |result|
      result.concat(recommended_feed_items)
      result.concat(recommended_amazon_items)
      result.each { |item| recommendations.build(:recommendable => item).save }
      
      Mailer.deliver_recommendations(self, result) unless result.empty?
      
      update_attribute :recommendations_generated_at, Time.now
    end
  end
  
  # return an array of AmazonItem
  def recommended_amazon_items
    existing_asins = recommendations.select { |r| r.recommendable.respond_to?(:asin) }.map { |r| r.recommendable.asin }
    items = AmazonItem.search_books_by_keywords(tag_list).reject do |amazon_item|
      existing_asins.include?(amazon_item.asin)
    end
    items[(0...5)]
  end

  # return an array of FeedItem
  def recommended_feed_items
    FeedItem.with_tags(tag_list).with_areas(areas).ordered.limit(5).unseen_by(self)
  end

  def name
    name = [first_name, last_name].compact.join(" ")
    [name, login, email].detect { |x| not x.blank? }
  end

  def add_tag(tag)
    unless tag.blank?
      tag_list << tag
      save
    end
  end
  
  def remove_tag(tag)
    tag_list.remove(tag)
    save
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected
    


end
