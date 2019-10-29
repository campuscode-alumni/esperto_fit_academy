class PriceSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :gym, :plan, :value
end