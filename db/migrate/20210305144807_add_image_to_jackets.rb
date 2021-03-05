class AddImageToJackets < ActiveRecord::Migration[6.1]
  def change
    add_column :jackets, :image, :string
  end 
end
