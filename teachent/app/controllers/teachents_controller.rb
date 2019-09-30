class TeachentsController < ApplicationController

  

  get '/teachents' do
    @teachents = correct_user.teachents
    erb :'teachents/index'
  end

  # get teachents/new to render a form to create new course
  get '/teachents/new' do
    unauthorized
    erb :'/teachents/new'
  end

  # post teachents to create a new courses
  post '/teachents' do
    unauthorized
    #
    if params[:subject] != "" && params[:course] != ""
      # create course
      @teachent = Teachent.create(subject: params[:subject], user_id: correct_user.id, course: params[:course])
      flash[:message] = "Congratulations!  You've started a course!" if @teachent.id
      redirect "/teachents/#{@teachent.id}"
    else
      flash[:errors] = "Something went wrong - all fields must be filled in."
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
    if @teachent.user == correct_user && params[:subject] != "" && params[:course] != ""
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