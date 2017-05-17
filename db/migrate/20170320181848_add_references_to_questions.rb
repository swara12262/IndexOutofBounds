class AddReferencesToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :user, foreign_key: true
    add_reference :questions, :subject, foreign_key: true

  end
end
