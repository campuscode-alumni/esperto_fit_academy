class AddParamsToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :name, :string
    add_column :employees, :gym, :integer
    add_column :employees, :status, :integer
    add_column :employees, :email, :string
    add_column :employees, :admin, :boolean, default: false
  end
end
