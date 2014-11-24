class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :username
      t.string :email
      t.string :key, unique: true

      t.timestamps
    end
    add_index :tickets, :key, unique: true
  end
end
