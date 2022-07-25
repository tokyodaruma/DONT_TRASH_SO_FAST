class AddCoordinatesToSurpluses < ActiveRecord::Migration[6.1]
  def change
    add_column :surpluses, :latitude, :float
    add_column :surpluses, :longitude, :float
  end
end
