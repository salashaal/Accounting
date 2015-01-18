class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.string :balance_type
      t.integer :total_amount
      t.references :account_type 

      t.timestamps
    end
  add_index :accounts, :account_type_id
  end
end
