class AddUserIdToEvents < ActiveRecord::Migration[4.2]
    add_column :events, :user_id, :integer
end