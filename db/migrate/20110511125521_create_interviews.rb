class CreateInterviews < ActiveRecord::Migration
  def self.up
   create_table :interviews do |t|
      t.string :name
      t.integer :total_exp
      t.integer :ror_exp
      t.datetime :doi
      t.string :type_location
      t.string :result
      t.string :phoneNumber
      t.text :remarks
      t.text :email

      t.timestamps
    end
  end

  def self.down
    drop_table :interviews
  end
end


