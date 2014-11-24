class CreateTicketsTypes < ActiveRecord::Migration
  def change
    create_table :tickets_types do |t|
      t.references :ticket
      t.references :department
      t.references :status
      t.references :operator
      t.string :subject
      t.text :description
      t.string :from

      t.timestamps
    end
    add_index :tickets_types, :ticket_id
    add_index :tickets_types, :department_id
    add_index :tickets_types, :status_id
    add_index :tickets_types, :operator_id
  end
end
