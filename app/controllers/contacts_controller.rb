class ContactsController < ApplicationController
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      flash[:success] = 'お問い合わせを受け付けました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '送信できませんでした。'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
  
end
