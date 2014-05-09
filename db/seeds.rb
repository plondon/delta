user = User.create(:name => "Phil", :email => "plondon@gm.slc.edu", :password => "password")

100.times do
  languages = %w(ruby javascript python java).shuffle
  Question.create(:user_id => 1, :start_language => languages.pop, :end_language => languages.pop, :query => "this is an example question")
end
