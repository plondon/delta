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
"How do I make equalities in Javascript?",
"How do I count to ten?"]


questions_text.each do |question|
	Question.create(:user_id => 1, :start_language => "ruby", :end_language => "javascript", :query => question)
end

Answer.create(:user => sherif, question: Question.find_by_query("How do I make an if-else loop in Javascript?"), original_solution: "http://i.imgur.com/wVw9DFj.png", final_solution: "http://i.imgur.com/B6JL4NA.png", delta: "http://i.imgur.com/2qmKaks.gif", votes: 10)
Answer.create(:user => sherif, question: Question.find_by_query("How do I make a Class object in Javascript?"), original_solution: "http://i.imgur.com/6wHXqQo.png", final_solution: "http://i.imgur.com/nW6hdKj.png", delta: "http://i.imgur.com/WkkMGwP.gif", votes: 10)
Answer.create(:user => nate, question: Question.find_by_query("How do I make method in Javascript?"), original_solution: "http://i.imgur.com/k5r2Zce.png", final_solution: "http://i.imgur.com/YwiUcG9.png", delta: "http://i.imgur.com/bXuYkZm.gif", comments: "Methods are split into to two when using javascript. Methods can become functions, but when dealing with a Class or Object they are called protoype functions. Prototype functions are called like 'number.multiply_by_two'.", votes: 7)
Answer.create(:user => nate, question: Question.find_by_query("How do I make map loop in Javascript?"), original_solution: "http://i.imgur.com/os9ilsl.png", final_solution: "http://i.imgur.com/LIaj4MY.png", delta: "http://i.imgur.com/tafY7oc.gif", votes: 12)
