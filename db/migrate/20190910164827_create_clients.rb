class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.integer :status, default: 0
      t.references :gym, foreign_key: true
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
