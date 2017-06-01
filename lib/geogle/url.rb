# encoding: UTF-8
require 'dotenv'

module Geogle
  module URL
    Dotenv.load
    BASE       = ENV["GOOGLE_API"]
    GEOCODE    = ENV["GOOGLE_API_GEOCODE"]
    DIRECTIONS = ENV["GOOGLE_API_DIRECTIONS"]
  end
end
