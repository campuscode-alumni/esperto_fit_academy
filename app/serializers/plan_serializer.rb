class PlanSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :name, :minimum_permanence
end