class RemoveDofFromInterviews < ActiveRecord::Migration
  def self.up
    remove_column :interviews, :dof
    add_column :interviews, :for_location, :string
  end

  def self.down
    add_column :interviews, :dof, :datetime
  end
end
