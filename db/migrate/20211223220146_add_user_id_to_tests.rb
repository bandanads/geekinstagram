class AddUserIdToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :user_id, :integer
  end
end
