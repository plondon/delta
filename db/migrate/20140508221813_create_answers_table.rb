class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.string :original_solution
      t.string :final_solution
      t.string :delta
      t.integer :votes, default: 0
      t.timestamps
    end
  end
end
