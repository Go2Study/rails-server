class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :pcn,          null: false, index: true
      t.string :first_name,   null: false
      t.string :last_name,    null: false
      t.string :display_name, null: false
      t.string :mail
      t.binary :photo,        limit: 1.megabytes
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
