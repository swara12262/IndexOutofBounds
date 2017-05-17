class AddReferencesToLikes < ActiveRecord::Migration[5.0]
  def change
    add_reference :likes, :user, foreign_key: true
    add_reference :likes, :answer, foreign_key: true
  end
end
