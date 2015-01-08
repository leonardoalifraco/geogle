# encoding: UTF-8

module Geogle
  class Geocoder < Base
    def address(address, components = {})
      executor(:address, address, components)
    end

    def latlng(lat, lng, result_types = [])
      executor(:latlng, lat, lng, result_types)
    end

    private

    def executor(method, *args)
      body = request(URL::GEOCODE, @parametizer.send(method, *args))
      return body["results"] if @raw
      Parser.places(body["results"])
    end
  end
end
