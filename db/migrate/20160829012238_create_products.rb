class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :pricing, scale: 2, precision: 10
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.attachment :avatar
      t.timestamps null: false
    end
  end
end
