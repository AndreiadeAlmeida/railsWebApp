class UserMailer < ApplicationMailer
  default from: 'andreia.ca22@gmail.com'

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'andreia.ca22@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
  @appname = "BikeLondon"
  mail(to: user.email,
       subject: "Welcome to #{@appname}!")
end

end
