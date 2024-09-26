class AddImageToStore < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :image, :string
  end
end
