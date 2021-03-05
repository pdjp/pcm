class AddImageToTShirts < ActiveRecord::Migration[6.1]
  def change
    add_column :t_shirts, :image, :string
  end
end
