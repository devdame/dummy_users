enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/log_in' do
  erb :log_in
end

get '/sign_up' do
  erb :sign_up
end


post '/sign_up' do

  User.create(params)
  erb :index
end

post '/log_out' do
  session.clear
  redirect to '/'
end

post '/login' do
  @user = User.authenticate(params[:user_name], params[:password])
  session[:user_name] = @user.user_name
  session[:user_id] = @user.id
  redirect to '/secret_page'
end

get '/secret_page' do
  if logged_in?
    erb :secret_page
  else
    redirect to '/log_in'
  end
end
