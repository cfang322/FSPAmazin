class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, null: false
      t.references :product, foreign_key: true, null: false 
      t.references :user, foreign_key: true, null: false 
      t.timestamps
  end
  add_index :cart_items, [:user_id, :product_id], unique: true
  end
end
