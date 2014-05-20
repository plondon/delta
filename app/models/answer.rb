class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes
  has_many :users, :through => :votes
  validates :original_solution, :final_solution, presence: true
  validates :original_solution, :final_solution, :delta, uniqueness: true

  def up_vote(user)
    if !self.users.include?(user)
      self.votes << Vote.new(:user => user)
    end
  end

  def down_vote(user)
    if self.users.include?(user)
      self.users.delete(user)
    end    
  end
end
