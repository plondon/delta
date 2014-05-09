class Question < ActiveRecord::Base
  has_many :answers

  validates :start_language, :end_language, presence: true

  def self.get_end_languages(questions)
    end_languages = []
    questions.each do |question|
      end_languages << question.end_language
    end
    return end_languages.uniq
  end
end
