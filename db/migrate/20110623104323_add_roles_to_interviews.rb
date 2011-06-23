class AddRolesToInterviews < ActiveRecord::Migration
  def self.up
    add_column :interviews, :cv_recieved_on, :datetime
    add_column :interviews, :recieved_from, :string
    add_column :interviews, :resource_name, :string
    add_column :interviews, :skills, :string
    add_column :interviews, :total_experience, :integer
    add_column :interviews, :contact_number, :string
    add_column :interviews, :source, :string
    add_column :interviews, :status, :string
    add_column :interviews, :remarks, :string
    add_column :interviews, :first_round, :string
    add_column :interviews, :second_round, :string
    add_column :interviews, :mr_round, :string
    add_column :interviews, :email, :string
    add_column :interviews, :date_of_interview, :datetime
    add_column :interviews, :date_of_joining, :datetime
  end

  def self.down
    remove_column :interviews, :date_of_joining
    remove_column :interviews, :date_of_interview
    remove_column :interviews, :email
    remove_column :interviews, :mr_round
    remove_column :interviews, :second_round
    remove_column :interviews, :first_round
    remove_column :interviews, :remarks
    remove_column :interviews, :status
    remove_column :interviews, :source
    remove_column :interviews, :contact_number
    remove_column :interviews, :total_experience
    remove_column :interviews, :skills
    remove_column :interviews, :resource_name
    remove_column :interviews, :recieved_from
    remove_column :interviews, :cv_recieved_on
  end
end
