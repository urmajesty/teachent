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
     flash[:notice] = "Hooray, Flash is working!"
    erb :welcome
    end

    helpers do

      def logged_in?
        !!my_user

      end

      def my_user
#creates and assigns if user is found else nil
        @my_user ||= User.find_by(session[:user_id])
      end

  # get "/binding" do
  #   binding.pry
   end
end
