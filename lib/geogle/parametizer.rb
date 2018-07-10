# encoding: UTF-8

module Geogle
  class Parametizer
    def initialize(params = {})
      @sensor   = params[:sensor]   || false
      @language = params[:language] || "en"
      @key = params[:key]
    end

    def address(address, components = {})
      options = {
        address:    address,
        language:   @language,
        components: components(components),
        sensor:     @sensor,
        key: @key
      }
      compact_hash(options)
    end

    def latlng(lat, lng, result_types = [])
      options = {
        latlng:   "#{lat},#{lng}",
        language: @language,
        result_type: result_types(result_types),
        sensor:   @sensor,
        key: @key
      }
      compact_hash(options)
    end

    def directions(origin, destination, params)
      waypoints = params[:waypoints] || []
      options = {
        origin:         origin,
        destination:    destination,
        mode:           params[:mode] || "driving",
        waypoints:      waypoints.join("|"),
        alternatives:   params[:alternatives],
        avoid:          params[:avoid],
        units:          params[:units],
        region:         params[:region],
        departure_time: params[:departure_time],
        arrival_time:   params[:arrival_time],
        sensor:         @sensor
      }
      compact_hash(options)
    end

    private

    def compact_hash(hash)
      hash.select { |k,v| !v.nil? && !v.to_s.empty? }
    end

    def components(components)
      components.collect do |component, value|
        "#{component}:#{value}"
      end.join('|')
    end

    def result_types(result_types)
      result_types.join('|')
    end
  end
end
