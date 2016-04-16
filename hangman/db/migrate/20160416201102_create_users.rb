class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :high
      t.integer :games

      t.timestamps null: false
    end
  end
end
