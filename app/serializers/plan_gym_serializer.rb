class PlanGymSerializer < ActiveModel::Serializer 
  attributes :plans

  class PlanSerializer < ActiveModel::Serializer
    attributes :name, :minimum_permanence
  end

  def plans
    object.plans.map do |plan|
      price = Price.find_by(plan: plan, gym: object).value
      PlanSerializer.new(plan).as_json.merge(price: price)
    end
  end
end
