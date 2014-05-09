class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :original_solution, :final_solution, presence: true
end
