class CreateUsers < ActiveRecord::Migration[4.2]
    def change
        create_table :users do |t|
            t.string :username
            t.string :password_digest
            t.string :name
            t.string :email
            t.string :bio
        end
    end
end