class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :minimum_permanence

      t.timestamps
    end
  end
end
