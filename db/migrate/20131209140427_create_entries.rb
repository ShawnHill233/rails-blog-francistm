class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :slug
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
