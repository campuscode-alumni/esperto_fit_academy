class CreateGymTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_trainers do |t|
      t.references :trainer, foreign_key: true
      t.references :gym, foreign_key: true

      t.timestamps
    end
  end
end
