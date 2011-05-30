class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :email
      t.string :password
      t.string :address
      t.string :phone_number
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
