class ConvertIncomeDebtDownToString < ActiveRecord::Migration
  def up
  	change_column :prequals, :income, :string
  	change_column :prequals, :debt, :string
  	change_column :prequals, :down_payment, :string
  end

  def down
  	change_column :prequals, :income, 'integer USING CAST(income AS integer)'
  	change_column :prequals, :debt, 'integer USING CAST(debt AS integer)'
  	change_column :prequals, :down_payment, 'integer USING CAST(down_payment AS integer)'
  end
end
