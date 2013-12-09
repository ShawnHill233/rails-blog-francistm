class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :site_url
      t.text :site_name

      t.timestamps
    end
  end
end
