class AddLocationIdToEvents < ActiveRecord::Migration[4.2]
    add_column :events, :location_id, :integer
end