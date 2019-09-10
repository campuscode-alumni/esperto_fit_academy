class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :status, default: 0
      t.float :price
      t.integer :duration
      t.integer :capacity
      t.string :difficulty
      t.string :equipments
      t.text :rules
      t.references :gym, foreign_key: true
      t.references :trainer, foreign_key: true

      t.timestamps
    end
  end
end
