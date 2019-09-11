class RemoveGymFromEmployee < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :gym, :integer
  end
end
