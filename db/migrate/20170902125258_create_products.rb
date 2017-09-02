class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, scale: 2, precision: 10
      t.string :currency, default: '£'

      t.timestamps
    end
  end
end
