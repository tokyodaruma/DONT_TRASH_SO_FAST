class ChangeSurplusToSurpluses < ActiveRecord::Migration[6.1]
  def change
    rename_table :surplus, :surpluses
  end
end
