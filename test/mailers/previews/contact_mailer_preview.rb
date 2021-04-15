# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/contact_mail
  def contact
     contact = Contact.new(message: "問い合わせメッセージ", message: "おはよう")

     ContactMailer.contact_mail(contact)
   end

end
