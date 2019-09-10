class AddPlanAndGymRefToPrice < ActiveRecord::Migration[5.2]
  def change
    add_reference :prices, :plan, foreign_key: true
    add_reference :prices, :gym, foreign_key: true
  end
end
