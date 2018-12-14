class LocationsController < ApplicationController
 def index
    @locations = Location.where.not(latitude: nil, longitude: nil)

    @markers = @locations.map do |location|
      {
        lng: location.longitude,
        lat: location.latitude
      }
    end
  end
end
