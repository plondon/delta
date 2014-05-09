phil = User.create(:name => "Phil", :email => "plondon@gm.slc.edu", :password => "password")
shaun = User.create(:name => "Shaun", :email => "shaunmcgeever@gmail.com", :password => "password")
sherif = User.create(:name => "Sherif", :email => "sherif@dbc.com", :password => "password")
nate = User.create(:name => "Nate", :email => "nate@dbc.com", :password => "password")

user_ids = [phil.id, shaun.id]

languages = %w(ruby javascript python java)

# 100.times do
#   languages = %w(ruby javascript python java).shuffle
#   Question.create(:user_id => 1, :start_language => languages.pop, :end_language => languages.pop, :query => "this is an example question")
# end

questions_text = ["How do I make an each loop in Javascript?",
"How do I make select loop in Javascript?",
"How do I make map loop in Javascript?",
"How do I make each_with_index loop in Javascript?",
"How do I make each_key loop in Javascript?",
"How do I make a Class object in Javascript?",
"How do I make method in Javascript?",
"How do I make variables in Javascript?",
"How do I make an if-else loop in Javascript?",
"How do I print text to the console in Javascript?",
"How do I make equalities in Javascript?"]


questions_text.length.times do 
	Question.create(:user_id => user_ids.sample, :start_language => ruby, :end_language => javascript, :query => questions_text.sample)
end

Answer.create(:user => User.find_by_name("Sherif"), question: Question.find_by_text("How do I make an if-else loop in Javascript?"), original_solution: "placeholder", final_solution: "placeholder", delta: "placeholder", votes: 10)

Answer.create(:user => User.find_by_name("Nate"), question: Question.find_by_text("How do I make an if-else loop in Javascript?"), original_solution: "placeholder", final_solution: "placeholder", delta: "placeholder", votes: 2)




