require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "invite" do
    @expected.subject = 'Mailer#invite'
    @expected.body    = read_fixture('invite')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Mailer.create_invite(@expected.date).encoded
  end

end
