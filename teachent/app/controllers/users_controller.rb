class UsersController < ApplicationController

#   # GET: /users
#   get "/users" do
#     erb :"/users/index.html"
#   end

#   # GET: /users/new
#   get "/users/new" do
#     erb :"/users/new.html"
#   end

#   # POST: /users
#   post "/users" do
#     redirect "/users"
#   end

#   # GET: /users/5
#   get "/users/:id" do
#     erb :"/users/show.html"
#   end

#   # GET: /users/5/edit
#   get "/users/:id/edit" do
#     erb :"/users/edit.html"
#   end

#   # PATCH: /users/5
#   patch "/users/:id" do
#     redirect "/users/:id"
#   end

#   # DELETE: /users/5/delete
#   delete "/users/:id/delete" do
#     redirect "/users"
#   end
# end

#render the login for
    get "/login" do
      erb :login
  end

#recieve login form & create session
    post "/login" do
      # #find the user
       @user = User.find_by(email: params[:email])
      # #verify the user then create session is the right user
       if @user.authenticate(params[:password])
      
      #   #inform and redirect
      #   #add key value pair to sessionhash
      #   #actually logging in
        session[:user_id] = @user.id
       puts session
        redirect "users/#{@user.id}"
      end
    end

      # #user SHOW route
       get '/users/:id' do
         "this is the show route"
       end
  

    #signup 
      get "/signup" do
    end
end