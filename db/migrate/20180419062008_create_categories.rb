class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.text :name, null: false
      t.text :desc
      t.text :icon
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
