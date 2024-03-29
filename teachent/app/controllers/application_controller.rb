require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SECRET']
    register Sinatra::Flash
  end

   get "/" do
  #    flash[:notice] = "Hooray, Flash is working!"
    erb :welcome
     end

    helpers do

      def authorized
        !!correct_user
      end

      def correct_user
        #creates and assigns if user is found else nil
        @correct_user ||= User.find_by(id: session[:user_id])
      end

      def editor(course)
        course.user == correct_user
      end

      #user has to be logged in to pass otherwise...
      def unauthorized
        if !authorized
          flash[:errors] = "Please login to continue."
          redirect '/'
        end
      end
  
        #user is logged in
          

  # get "/binding" do
  #   binding.pry
   end
end
