class AddImageToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :image, :string
  end
end
