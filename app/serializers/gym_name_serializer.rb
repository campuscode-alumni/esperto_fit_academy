class GymNameSerializer
    include FastJsonapi::ObjectSerializer
    set_id :id
    attributes :name

    attribute :name do |object|
        PriceSerializer.new(object)
    end
end