class ContactMailer < ApplicationMailer
  def send_contact_email
    @contact = params[:contact]
    mail(to: 'wxmmiao0@gmail.com', subject: "Message from #{@contact.name} (#{@contact.email})")
  end
end
