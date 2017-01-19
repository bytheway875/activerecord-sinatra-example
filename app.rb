require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database, {adapter: 'sqlite3', database: 'blog.sqlite3' }


get '/' do
  @users = User.all
  erb :users
end

post '/users' do
  @user = User.create(params)
  redirect to("/")
end

# edit
put '/users/:id' do
end

# :id indicates a dynamic route.
get '/users/:id' do
  @user = User.find(params[:id])
  erb :user
end


get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post
end

  # Post.create(user_id: params[:id], title: "My First Blog Post", content: "This is the #{@user.first_name}'s short blog post to show you as an example.")
