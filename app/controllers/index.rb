get '/' do
  # render home page
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
    erb :sign_in
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end


#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  @user = User.new
  erb :sign_up
end

post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect '/'
  else
    # an error occurred, re-render the sign-up form, displaying errors
    erb :sign_up
  end
end

#------- QUESTIONS ----------

get '/questions/:language' do
  @start_language = params[:language].downcase

  @ruby_questions       = ['Ruby', Question.where(:end_language => 'ruby', :start_language => @start_language)]
  @javascript_questions = ['JavaScript', Question.where(:end_language => 'javascript', :start_language => @start_language)]
  @python_questions     = ['Python', Question.where(:end_language => 'python', :start_language => @start_language)]
  @java_questions       = ['Java', Question.where(:end_language => 'java', :start_language => @start_language)]

  @questions = [@ruby_questions, @javascript_questions, @python_questions, @java_questions]
  erb :"questions/show"
end

get '/question/new' do
  erb :"questions/new"
end

post '/questions' do
  redirect to '/questions/show'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
end

#------- ANSWERS -----------
