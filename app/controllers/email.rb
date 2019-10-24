#
# class MakersBnb < Sinatra::Base
#   #They sign up
#   get '/home/email' do
#     # Pony.mail(
#     # to: current_user.email,
#     # # from: "MyApp Help Desk <noreply@myapp.com>",
#     # from: 'themakersbnb@outlook.com',
#     # subject: "Thank you for signing up",
#     # body: "Thank you for signing up to MakersBnB.  We look forward to finding you some fantastic houses for your future stays." +
#     #       "If you did not make sign up to MakersBnB, please ignore this email.")
#     # # html_body: haml(
#     # #   :verify_account_email,
#     # #   layout: false,
#     # #   locals: {
#     # #     date: DateTime.now.strftime("%H:%M:%S%P %B %d, %Y"),
#     # #   }
#     # # )
#     @current_user = current_user
#     Email.send_greeting_email(@current_user)
#   end
#
# end
