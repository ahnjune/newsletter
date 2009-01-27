class Mailer < ActionMailer::Base

  helper ApplicationHelper
  
  def recommendations(user, recommendations, sent_at = Time.now)
    subject    "New Thinkful Recommendations"
    recipients user.email
    from       'do-not-reply@thinkful.info'
    sent_on    sent_at
    
    books = recommendations.select { |r| r.kind_of?(AmazonItem)}
    articles = recommendations - books
    
    body       :user => user, :books => books, :articles => articles
  end

  def invite(from_user, email, sent_at = Time.now)
    subject    "#{from_user.name} has invited you to Thinkful.info"
    recipients email
    from       'do-not-reply@thinkful.info'
    sent_on    sent_at
    body       :from_user => from_user
  end

end
