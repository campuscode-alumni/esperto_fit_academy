class RemoveAttributeFromGym < ActiveRecord::Migration[5.2]
  def change
    remove_column :gyms, :adress, :string
  end
end
