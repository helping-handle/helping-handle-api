class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :user, foreign_key: true
      t.references :goal, foreign_key: true
      t.monetize :amount
      t.monetize :amount_actual
      t.text :message_donor
      t.text :message_recipient
      t.integer :status

      t.timestamps
    end
  end
end
