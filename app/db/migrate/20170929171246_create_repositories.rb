class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.integer :repo_id
      t.string :name
      t.string :user
      t.string :description
      t.integer :stars

      t.timestamps
    end
  end
end
