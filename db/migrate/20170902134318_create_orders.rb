class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.string :status, default: 'new'
      t.decimal :total_price, precision: 10, scale: 2
      t.string :address
      t.string :credit_card_number
      t.string :email

      t.timestamps
    end
  end
end
