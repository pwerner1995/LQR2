class CreateStoreDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :store_drinks do |t|
      t.integer :drink_id
      t.integer :store_id

      t.timestamps
    end
  end
end
