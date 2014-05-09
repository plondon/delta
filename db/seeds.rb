phil = User.create(:name => "Phil", :email => "plondon@gm.slc.edu", :password => "password")
shaun = User.create(:name => "Shaun", :email => "shaunmcgeever@gmail.com", :password => "password")
sherif = User.create(:name => "Sherif", :email => "sherif@dbc.com", :password => "password")
nate = User.create(:name => "Nate", :email => "nate@dbc.com", :password => "password")

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


questions_text.each do |question|
	Question.create(:user_id => 1, :start_language => "ruby", :end_language => "javascript", :query => question)
end

Answer.create(:user => sherif, question: Question.find_by_query("How do I make an if-else loop in Javascript?"), original_solution: "http://i.imgur.com/wVw9DFj.png", final_solution: "http://i.imgur.com/B6JL4NA.png", delta: "http://i.imgur.com/2qmKaks.gif", votes: 10)
Answer.create(:user => sherif, question: Question.find_by_query("How do I make a Class object in Javascript?"), original_solution: "http://i.imgur.com/6wHXqQo.png", final_solution: "http://i.imgur.com/nW6hdKj.png", delta: "http://i.imgur.com/WkkMGwP.gif", votes: 10)
