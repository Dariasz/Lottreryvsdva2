class UserMailer < ApplicationMailer

  def WinEmail(user, item)
    @user = user
    @item = item
    mail(to: @user.email , subject: 'You have won somthing')
  end

end
