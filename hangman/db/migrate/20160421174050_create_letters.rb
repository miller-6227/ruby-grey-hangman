class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :name
      t.integer :frequency
    end
    add_index :letters, :name, unique: true
  end
end
