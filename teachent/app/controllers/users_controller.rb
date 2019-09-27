class UsersController < ApplicationController

  get '/logout' do
    session.clear
    redirect '/'
  end
#login page
    get "/login" do
      authorized
      erb :login
  end

#recieve login form & create session
    post "/login" do
      # #find the user
       @user = User.find_by(email: params[:email])
      # need to have email && password to continue
       if @user && @user.authenticate(params[:password])

      #   #actually logging in
        session[:user_id] = @user.id
        flash[:message] = "Welcome, #{@user.name}!"
        redirect "users/#{@user.id}"
    else
      flash[:errors] = "Invalid login information .  Please sign up or try again."

      redirect "/login"
      end
    end

    #signup 
      get "/signup" do

        erb :signup
    end

   # POST: /users
   post "/users" do
     #redirect "/users"
     #Put thru the user only if they fill the form 
  
      @user = User.new(params)
        #if they have a valid input
      if @user.save
        #log them in
        session[:user_id] = @user.id 
        flash[:message] = "Congratulations!  You have created your account!"
        redirect "/users/#{@user.id}"
      else
        #inform them of error
        flash[:errors] = "Error creating account #{@user.errors.full_messages.to_sentence}"
        redirect '/signup'
      end
    end
  
    # SHOW route
    get "/users/:id" do
      # first
      @user = User.find_by(id: params[:id])
      unauthorized
  
      erb :"/users/show"
    end
  
  
  
  end
