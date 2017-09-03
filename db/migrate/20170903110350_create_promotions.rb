class CreatePromotions < ActiveRecord::Migration[5.1]
  def change
    create_table :promotions do |t|
      t.string :code
      t.string :kind
      t.integer :discount
      t.boolean :connectable

      t.timestamps
    end
  end
end
