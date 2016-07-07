class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def WinEmail(user)
    @user = user
    mail(to: @user.email, subject: 'You have won somthing')
  end


end
