class AddIndexes < ActiveRecord::Migration
  def change
    add_index :users,   :email,    unique: true
    add_index :users,   :username, unique: true
    add_index :entries, :slug,     unique: true, length: 255
  end
end
