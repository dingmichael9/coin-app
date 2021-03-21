class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.decimal :balance, :precision => 15, :scale => 2

      t.timestamps
    end
  end
end
