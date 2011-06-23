class RemoveRolesFromInterviews < ActiveRecord::Migration
  def self.up
    remove_column :interviews, :name
    remove_column :interviews, :total_exp
    remove_column :interviews, :ror_exp
    remove_column :interviews, :doi
    remove_column :interviews, :type_location
    remove_column :interviews, :result
    remove_column :interviews, :phoneNumber
    remove_column :interviews, :remarks
    remove_column :interviews, :email
  end

  def self.down
    add_column :interviews, :email, :text
    add_column :interviews, :remarks, :text
    add_column :interviews, :phoneNumber, :string
    add_column :interviews, :result, :string
    add_column :interviews, :type_location, :string
    add_column :interviews, :doi, :datetome
    add_column :interviews, :ror_exp, :integer
    add_column :interviews, :total_exp, :integer
    add_column :interviews, :name, :string
  end
end
