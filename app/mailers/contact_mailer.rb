class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail(
      from: 'sample@example.com',
      to:   'morit617@gmail.com',
      subject: 'お問い合わせ通知'
    )
  end

end
