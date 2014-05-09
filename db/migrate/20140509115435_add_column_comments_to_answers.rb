class AddColumnCommentsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :comments, :text
  end
end
