class AddStatusToTrainer < ActiveRecord::Migration[5.2]
  def change
    add_column :trainers, :status, :integer , default: 0
  end
end
