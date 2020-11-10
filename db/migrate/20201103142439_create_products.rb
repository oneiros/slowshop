class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.references :category, foreign_key: true
      t.text :metadata
      t.string :ean, nil: false, unique: true
      t.string :product_code, nil: false, unique: true
      t.integer :stock, default: 1
      t.datetime :available_from
      t.text :comment

      t.timestamps
    end
  end
end
