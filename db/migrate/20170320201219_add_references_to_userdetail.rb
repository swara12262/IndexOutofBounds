class AddReferencesToUserdetail < ActiveRecord::Migration[5.0]
  def change
    add_reference :userdetails, :user, foreign_key: true
  end
end
