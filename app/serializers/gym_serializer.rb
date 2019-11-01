class GymSerializer
  include FastJsonapi::ObjectSerializer
  set_id :id
  attributes :name, :address, :open_hour, :close_hour, :working_days, :gallery

  attribute :gallery do |object|
    object.gallery.map { |image| Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true) }
  end
end
