class ChangeEventsFromDatetime < ActiveRecord::Migration[4.2]
    change_column :events, :starts_at, :string
    change_column :events, :ends_at, :string
end