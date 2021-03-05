class AddImageToPants < ActiveRecord::Migration[6.1]
  def change
    add_column :pants, :image, :string
  end
end
