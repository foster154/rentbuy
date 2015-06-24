class AddLoanFieldsToAccounts < ActiveRecord::Migration
  def change
  	add_column :accounts, :apr, :float
  	add_column :accounts, :ti, :float
  end
end
