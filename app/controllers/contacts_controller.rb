class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactMailer.with(contact: @contact).send_contact_email.deliver_now
      redirect_to root_path, notice: "Votre message a été envoyé avec succès."
    else
      redirect_to root_path, alert: "Il y a eu une erreur lors de l'envoi de votre message. Veuillez réessayer."
    end
  end

private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
