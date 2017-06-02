# encoding: UTF-8
require 'dotenv'

module Geogle
  module URL
    Dotenv.load
    BASE       = ENV["GOOGLE_API"] || "https://maps.googleapis.com"
    GEOCODE    = ENV["GOOGLE_API_GEOCODE"] || "#{BASE}/maps/api/geocode/json"
    DIRECTIONS = ENV["GOOGLE_API_DIRECTIONS"] || "#{BASE}/maps/api/directions/json"
  end
end
