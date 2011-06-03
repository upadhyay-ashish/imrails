class AddRoleToInterviews < ActiveRecord::Migration
  def self.up
    add_column :interviews, :dof, :date
    add_column :interviews, :refer, :string
  end

  def self.down
    remove_column :interviews, :refer
    remove_column :interviews, :dof
  end
end
