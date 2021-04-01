class CreateEvents < ActiveRecord::Migration[4.2]
    def change
        create_table :events do |t|
            t.string :name
            t.string :info
            t.datetime :starts_at
            t.datetime :ends_at
        end
    end
end