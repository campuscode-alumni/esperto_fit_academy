class SimpleGymSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  include ApplicationHelper
  
  attributes :cod, :name, :open_hour, :close_hour,
             :working_days, :address, :images

  def images
    object.gallery.map do |image|
      'http://www.example.com' + rails_blob_path(image, only_path: true) 
    end
  end    
end
