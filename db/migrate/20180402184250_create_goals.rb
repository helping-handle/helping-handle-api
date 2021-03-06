class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.references :user, foreign_key: true
      t.text :name
      t.text :desc
      t.integer :amount_cents
      t.datetime :posted
      t.boolean :public
      t.boolean :deleted

      t.timestamps
    end
  end
end
