class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.text :title
      t.text :technology
      t.text :description
      t.text :githublink

      t.timestamps
    end
  end
end
