class AddImageToSweatshirts < ActiveRecord::Migration[6.1]
  def change
    add_column :sweatshirts, :image, :string
  end
end
