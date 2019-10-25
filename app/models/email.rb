require 'pony'
require 'erb'

class Email
  def self.send_greeting_email(current_user)
    Pony.mail(
      :to => current_user.email,
      :from => "MakersBnB Customer Service Team <noreply@makersbnb.com>",
      :subject => "Thank you for signing up",
      :body => "Thank you for signing up to MakersBnB.  We look forward to finding you some fantastic houses for your future stays." +
            "If you did not make sign up to MakersBnB, please ignore this email.",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => 'apikey',
        :password => ENV['SENDGRID_API'],
        :authentication => :plain,
        :enable_starttls_auto => true,
      }
    )
  end

  def self.send_create_space_email(current_user)
    Pony.mail(
      :to => current_user.email,
      :from => "MakersBnB Customer Service Team <noreply@makersbnb.com>",
      :subject => "Confirmation of new listing",
      :body => "Thank you for listing you new property with MakersBnB." +
            "  If you did not list a new property with MakersBnB, please ignore this email.",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => 'apikey',
        :password => ENV['SENDGRID_API'],
        :authentication => :plain,
        :enable_starttls_auto => true,
      }
    )
  end

  def self.send_update_space_email(current_user)
    Pony.mail(
      :to => current_user.email,
      :from => "MakersBnB Customer Service Team <noreply@makersbnb.com>",
      :subject => "Confirmation of listing update",
      :body => "You have updated on of your properties on MakersBnB" +
            "  If you did not make this update to MakersBnB, please ignore this email.",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => 'apikey',
        :password => ENV['SENDGRID_API'],
        :authentication => :plain,
        :enable_starttls_auto => true,
      }
    )
  end

  def self.guest_book_space_email(current_user)
    Pony.mail(
      :to => current_user.email,
      :from => "MakersBnB Customer Service Team <noreply@makersbnb.com>",
      :subject => "Thank you for booking with MakersBnB",
      :body => "Your booking request has been sent to the landlord.  We look forward to finding you some more fantastic houses for your future stays." +
            "If you did not make this booking to MakersBnB, please ignore this email.",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => 'apikey',
        :password => ENV['SENDGRID_API'],
        :authentication => :plain,
        :enable_starttls_auto => true,
      }
    )
  end

  def self.guest_booking_confirm_email(current_user)
    Pony.mail(
      :to => current_user.email,
      :from => "MakersBnB Customer Service Team <noreply@makersbnb.com>",
      :subject => "Booking confimed",
      :body => "Landlord has confirmed your booking.  We look forward to finding you some fantastic houses for your future stays." +
            "If you did not make sign up to MakersBnB, please ignore this email.",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => 'apikey',
        :password => ENV['SENDGRID_API'],
        :authentication => :plain,
        :enable_starttls_auto => true,
      }
    )
  end

  def self.guest_booking_denied_email(current_user)
    Pony.mail(
      :to => current_user.email,
      :from => "MakersBnB Customer Service Team <noreply@makersbnb.com>",
      :subject => "Booking denied",
      :body => "Your booking at ... has been denied by the landlord.  We look forward to finding you some fantastic houses for your future stays." +
            "If you did not make sign up to MakersBnB, please ignore this email.",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => 'apikey',
        :password => ENV['SENDGRID_API'],
        :authentication => :plain,
        :enable_starttls_auto => true,
      }
    )
  end

  def self.property_booking_request_email(current_user)
    Pony.mail(
      :to => current_user.email,
      :from => "MakersBnB Customer Service Team <noreply@makersbnb.com>",
      :subject => "Booking request made",
      :body => "Somebody has requested to book your listed property." +
            "If you did not make sign up to MakersBnB, please ignore this email.",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => 'apikey',
        :password => ENV['SENDGRID_API'],
        :authentication => :plain,
        :enable_starttls_auto => true,
      }
    )
  end

  def self.property_booking_confirmed_email(current_user)
    Pony.mail(
      :to => current_user.email,
      :from => "MakersBnB Customer Service Team <noreply@makersbnb.com>",
      :subject => "Booking request confirmed",
      :body => "You have confirmed a booking request for ..." +
            "If you did not make sign up to MakersBnB, please ignore this email.",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => 'apikey',
        :password => ENV['SENDGRID_API'],
        :authentication => :plain,
        :enable_starttls_auto => true,
      }
    )
  end

  def self.property_booking_denied_email(current_user)
    Pony.mail(
      :to => current_user.email,
      :from => "MakersBnB Customer Service Team <noreply@makersbnb.com>",
      :subject => "Booking denied",
      :body => "Thank you for signing up to MakersBnB.  We look forward to finding you some fantastic houses for your future stays." +
            "If you did not make sign up to MakersBnB, please ignore this email.",
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :user_name => 'apikey',
        :password => ENV['SENDGRID_API'],
        :authentication => :plain,
        :enable_starttls_auto => true,
      }
    )
  end
end
