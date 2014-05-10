class Question < ActiveRecord::Base
  has_many :answers

  validates :start_language, :end_language, presence: true

  def top_answer
    return self.answers.sort_by {:votes}.first
  end

  def self.get_questions(start_language)
    @ruby_questions       = ['Ruby', Question.where(:end_language => 'ruby', :start_language => start_language)]
    @javascript_questions = ['JavaScript', Question.where(:end_language => 'javascript', :start_language => start_language)]
    @python_questions     = ['Python', Question.where(:end_language => 'python', :start_language => start_language)]
    @java_questions       = ['Java', Question.where(:end_language => 'java', :start_language => start_language)]

    @questions = [@ruby_questions, @javascript_questions, @python_questions, @java_questions]
  end
end
