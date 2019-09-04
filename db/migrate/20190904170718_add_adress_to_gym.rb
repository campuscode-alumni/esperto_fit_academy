class AddAdressToGym < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :address, :string
  end
end
