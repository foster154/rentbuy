class CreatePrequals < ActiveRecord::Migration
  def change
    create_table :prequals do |t|
      t.integer :guest_id
      t.integer :income
      t.integer :debt
      t.integer :down_payment

      t.timestamps
    end
  end
end
