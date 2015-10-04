class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :size
      t.string :season
      t.string :gender
      t.string :part_number
      t.decimal :value
      t.decimal :rate
      t.string :vendor
      t.timestamps null: false
    end
  end
end
