class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.text :name
      t.text :slug
      t.text :desc
      t.text :email
      t.text :icon
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6

      t.timestamps
    end
  end
end
