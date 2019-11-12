class AddQuantityToDrinks < ActiveRecord::Migration[6.0]
  def change
    add_column :drinks, :quantity, :integer
  end
end
