class RemoveAtrributeCpfFromClient < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :cpf, :integer
  end
end
