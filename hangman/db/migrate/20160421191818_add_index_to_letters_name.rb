class AddIndexToLettersName < ActiveRecord::Migration
  def change
  	add_index :letters, :name, unique: true
  end
end
