class Mailer < ActionMailer::Base
  
  def recommendations(user, recommendations, sent_at = Time.now)
    subject    "New Thinkful Recommendations"
    recipients user.email
    from       'do-not-reply@thinkful.info'
    sent_on    sent_at
    body       :user => user, :recommendations => recommendations
  end

  def invite(from_user, email, sent_at = Time.now)
    subject    "#{from_user.name} has invited you to Thinkful.info"
    recipients email
    from       'do-not-reply@thinkful.info'
    sent_on    sent_at
    body       :from_user => from_user
  end

end
