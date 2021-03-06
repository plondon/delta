get '/' do
  # render home page
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

  @questions = Question.get_questions(@start_language)
  erb :"questions/show"
end

get '/question/new' do
  erb :"questions/new"
end

post '/questions' do
  @start_language = params[:question][:start_language]

  Question.create(params[:question])
  redirect to "/questions/#{@start_language}"
end

#------- ANSWERS -----------

get '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :"answers/show"
end

get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :"answers/new"
end

post '/questions/:id/answers' do
  @user = User.find(session[:user_id])
  @question = Question.find(params[:id])

  @answer = Answer.create(:user_id => @user.id, :question_id => @question.id, :original_solution => params[:original_solution], :delta => params[:delta], :final_solution => params[:final_solution])
  redirect to "/questions/#{@question.id}/answers"
end

#--------- VOTES ------------

post '/vote' do
  if !current_user
    return "Must be logged in to vote!"
  end
end

post '/add_votes' do
  if current_user
    @user = User.find(session[:user_id])
    @answer = Answer.find(params[:answer])

    @answer.up_vote(@user)

    return {votes: (@answer.votes.size)}.to_json
  else
    return {error: "Must be logged in to vote"}.to_json
  end
end

post '/down_vote' do
  if current_user
    @user = User.find(session[:user_id])
    @answer = Answer.find(params[:answer])

    @answer.down_vote(@user)

    return {votes: (@answer.votes.size)}.to_json
  else
    return "Must be logged in to vote"
  end
end
