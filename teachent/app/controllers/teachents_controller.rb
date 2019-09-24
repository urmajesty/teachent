class TeachentsController < ApplicationController

  # GET: /teachents
  get "/teachents" do
    erb :"/teachents/index.html"
  end

  # GET: /teachents/new
  get "/teachents/new" do
    erb :"/teachents/new.html"
  end

  # POST: /teachents
  post "/teachents" do
    redirect "/teachents"
  end

  # GET: /teachents/5
  get "/teachents/:id" do
    erb :"/teachents/show.html"
  end

  # GET: /teachents/5/edit
  get "/teachents/:id/edit" do
    erb :"/teachents/edit.html"
  end

  # PATCH: /teachents/5
  patch "/teachents/:id" do
    redirect "/teachents/:id"
  end

  # DELETE: /teachents/5/delete
  delete "/teachents/:id/delete" do
    Teachent.find(params[:id]).destro
    redirect "/teachents"
  end
end
