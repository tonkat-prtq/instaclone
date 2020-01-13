class PostMailer < ApplicationMailer
  def post_mail(contact)
    @contact = contact

    mail to: "k2t.y4kn@gmail.com", subject: "投稿確認メール"
  end
end
