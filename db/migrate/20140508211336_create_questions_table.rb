class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :user
      t.string :query
      t.string :start_language
      t.string :end_language
      t.
    end
  end
end
