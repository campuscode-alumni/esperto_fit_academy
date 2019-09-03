class RemoveEmailFromEmployee < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :email, :string
  end
end
