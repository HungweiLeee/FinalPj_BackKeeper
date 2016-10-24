class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_comment.subject
  #

  default :from => "BagKeeper <bagkeeper@gocubs.com>"

  def notify_comment(reservation)
    @reservation = reservation
    mail(:to => @reservation.user.email, :subject => "您有一筆新訂單")
  end
end
