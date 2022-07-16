class CreateSurplus < ActiveRecord::Migration[6.1]
  def change
    create_table :surplus do |t|
      t.integer :category
      t.text :description
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
