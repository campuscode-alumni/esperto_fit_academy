class AddNameCpfToTrainer < ActiveRecord::Migration[5.2]
  def change
    add_column :trainers, :name, :string
    add_column :trainers, :cpf, :integer
  end
end
