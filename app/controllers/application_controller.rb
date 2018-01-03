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
    #binding.pry
    Post.create(params)
    @posts = Post.all
    erb :index
  end

  get '/posts' do
    #binding.pry
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    #binding.pry
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    #binding.pry
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    #binding.pry
    @post = Post.find(params[:id]).update({:name => params[:name], :content => params[:content]})
    erb :show
  end

  delete '/posts/:id/delete' do
    Post.find(params[:id]).destroy
  end
end
