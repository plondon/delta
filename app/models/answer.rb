class Answer < ActiveRecord::Base
  validates :original_solution, :final_solution, :delta, presence: true
end
