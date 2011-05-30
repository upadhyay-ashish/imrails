class RemoveColumnFromInterviews < ActiveRecord::Migration
  def self.up
    remove_column :interviews, :ror_exp
    add_column :interviews, :ror_exp, :string
  end

  def self.down
    remove_column :interviews, :ror_exp
    add_column :interviews, :ror_exp, :integer
  end
end
