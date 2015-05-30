class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :subdomain, unique: true, null: false

      t.timestamps
    end
  end
end
