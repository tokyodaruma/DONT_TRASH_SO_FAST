class AddNameToSurpluses < ActiveRecord::Migration[6.1]
  def change
    add_column :surpluses, :name, :string
  end
end
