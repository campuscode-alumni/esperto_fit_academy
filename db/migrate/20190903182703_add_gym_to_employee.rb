class AddGymToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :gym, :string
  end
end
