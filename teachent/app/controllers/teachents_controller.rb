class TeachentsController < ApplicationController

#   # GET: /teachents
#   get "/teachents" do
#     erb :"/teachents/index.html"
#   end

#   # GET: /teachents/new
#   get "/teachents/new" do
#     erb :"/teachents/new.html"
#   end

#   # POST: /teachents
#   post "/teachents" do
#     redirect "/teachents"
#   end

#   # GET: /teachents/5
#   get "/teachents/:id" do
#     erb :"/teachents/show.html"
#   end

#   # GET: /teachents/5/edit
#   get "/teachents/:id/edit" do
#     erb :"/teachents/edit.html"
#   end

#   # PATCH: /teachents/5
#   patch "/teachents/:id" do
#     redirect "/teachents/:id"
#   end

#   # DELETE: /teachents/5/delete
#   delete "/teachents/:id/delete" do
#     redirect "/teachents"
#   end
# end


  get '/teachents' do
    @teachents = Teachent.all
    erb :'teachents/index'
  end

  # get teachents/new to render a form to create new entry
  get '/teachents/new' do
    unauthorized
    erb :'/teachents/new'
  end

  # post teachents to create a new courses
  post '/teachents' do
    unauthorized
    #
    if params[:subject] != ""
      # create course
      @teachent = Teachent.create(subject: params[:subject], user_id: correct_user.id, course: params[:course], mood: params[:mood])
      flash[:message] = "Congratulations!  You've started a course!" if @teachent.id
      redirect "/teachents/#{@teachent.id}"
    else
      flash[:errors] = "Something went wrong - you must provide subject for your entry."
      redirect '/teachents/new'
    end
  end

  get '/teachents/:id' do
    set_course
    erb :'/teachents/show'
  end





    #edit form(edit.erb)
  get '/teachents/:id/edit' do
    unauthorized
    set_course
    if editor(@teachent)
      erb :'/teachents/edit'
    else
      redirect "users/#{correct_user.id}"
    end
  end

  
  patch '/teachents/:id' do
    unauthorized
    #  find course
    set_course
    if @teachent.user == correct_user && params[:subject] != ""
    #  update course
      @teachent.update(subject: params[:subject])
      #redirect to show 
      redirect "/teachents/#{@teachent.id}"
    else
      redirect "users/#{correct_user.id}"
    end
  end

  delete '/teachents/:id' do
    set_course
    if editor(@teachent)
      @teachent.destroy
      flash[:message] = "Your course has been deleted."
      redirect '/teachents'
    else
      redirect '/teachents'
    end
  end


  private

  def set_course
    @teachent = Teachent.find(params[:id])
  end
end