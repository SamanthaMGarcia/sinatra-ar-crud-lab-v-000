
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = self.create(params)
    redirect to '/posts'
  end

  get '/posts' do
    @posts = self.all
    erb :index
  end

  get '/posts/:id' do
    @post = self.find_by_id(params[:id])
    erb :edit
  end

end
