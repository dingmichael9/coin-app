class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.decimal :amount, :precision => 15, :scale => 2
      t.boolean :approved

      t.timestamps
    end
  end
end
