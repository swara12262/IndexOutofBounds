class CreateUserdetails < ActiveRecord::Migration[5.0]
  def change
    create_table :userdetails do |t|
      t.string :firstname
      t.string :lastname
      t.string :dateofbirth
      t.string :gender
      t.string :country
      t.text :interests
      t.string :usertype
      t.string :qualification

      t.timestamps
    end
  end
end
