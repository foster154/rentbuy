class ChangeCallTimeToString < ActiveRecord::Migration
  def up
  	change_column :prequals, :call_time, :string
  end

  def down
  	change_column :prequals, :call_time, :datetime
  end
end
