class AddEmailToTrainer < ActiveRecord::Migration[5.2]
  def change
    add_column :trainers, :email, :string
  end
end
