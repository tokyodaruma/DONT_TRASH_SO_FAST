class CreateSurpluses < ActiveRecord::Migration[6.1]
  def change
    create_table :surpluses do |t|
      t.integer :category
      t.text :description
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
