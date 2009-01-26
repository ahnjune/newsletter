class Mailer < ActionMailer::Base
  

  def invite(from_user, email, host, sent_at = Time.now)
    subject    "#{from_user.name} has invited you to Thinkful.info"
    recipients email
    from       'do-not-reply@thinkful.info'
    sent_on    sent_at
    body       :from_user => from_user, :host => host
  end

end
