require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models'

set :database, {adapter: 'sqlite3', database: 'blog.sqlite3' }
enable :sessions

get '/' do
  @current_user = User.find_by(id: session[:user_id])
  @users = User.all
  erb :users
end

get '/login' do
  erb :login
end

get '/logout' do
  session[:user_id] = nil
end

post '/login' do
  # {"username"=>"bytheway875", "password"=>"password"}
  @user = User.find_by(username: params[:username])
  database_password = @user.password
  entered_password = params[:password]

  password_match = database_password == entered_password

  if @user && password_match
    session[:user_id] = @user.id
    puts "My session user id is: #{session[:user_id]}"
    flash[:notice] = "You signed in!"
    redirect to '/'
  else
    flash[:warning] = "Your login information is WRONG!"
    redirect to '/login'
  end

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
