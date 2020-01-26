class PostMailer < ApplicationMailer
  def post_mail(contact)
    @contact = contact

    mail to: @contact, subject: "投稿確認メール"
  end
end
