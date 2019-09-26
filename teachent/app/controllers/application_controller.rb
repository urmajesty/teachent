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

  get "/binding" do
    binding.pry
  end
end
