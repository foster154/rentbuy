class AddSessionIdToPrequals < ActiveRecord::Migration
  def change
  	add_column :prequals, :session_id, :string
  end
end
