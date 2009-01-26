class Mailer < ActionMailer::Base
  

  def invite(from_user, email, host, sent_at = Time.now)
    subject    'You have been invited to a newsletter'
    recipients email
    from       'do-not-reply@newsletter.nimbletechnique.com'
    sent_on    sent_at
    body       :from_user => from_user, :host => host
  end

end
