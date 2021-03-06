class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :email
      t.integer :phone_number
      t.string :password_hash
      t.string :password_salt

      t.timestamps null: false
    end
  end
end
