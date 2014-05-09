class Question < ActiveRecord::Base
  has_many :answers

  validates :start_language, :end_language, presence: true
end
