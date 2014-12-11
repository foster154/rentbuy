class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.integer :guest_id
      t.integer :area_id
      t.integer :payment

      t.timestamps
    end
  end
end
