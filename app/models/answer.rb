class Answer < ActiveRecord::Base
  belongs_to :user
  validates :original_solution, :final_solution, presence: true
end
