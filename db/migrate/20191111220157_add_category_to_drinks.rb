class AddCategoryToDrinks < ActiveRecord::Migration[6.0]
  def change
    add_column :drinks, :category, :string
    add_column :drinks, :description, :string
  end
end
