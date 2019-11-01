class ActivitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :status, :price, :duration, :capacity, :difficulty, :equipments, :rules, :gym_id, :trainer_id
end
