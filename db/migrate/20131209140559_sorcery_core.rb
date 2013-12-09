class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :salt
      t.string :email
      t.string :username
      t.string :crypted_password

      t.timestamps
    end
  end
end
