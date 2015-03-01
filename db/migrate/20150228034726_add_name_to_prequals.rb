class AddNameToPrequals < ActiveRecord::Migration
  def change
    add_column :prequals, :name, :string
  end
end
