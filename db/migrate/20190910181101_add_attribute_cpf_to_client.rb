class AddAttributeCpfToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :cpf, :string
  end
end
