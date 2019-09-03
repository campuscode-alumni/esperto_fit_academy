class AddAtributtesToGym < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :name, :string
    add_column :gyms, :cod, :integer
    add_column :gyms, :adress, :string
    add_column :gyms, :open_hour, :string
    add_column :gyms, :close_hour, :string
    add_column :gyms, :working_days, :string
  end
end
