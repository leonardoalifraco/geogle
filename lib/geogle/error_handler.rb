# encoding: UTF-8

module Geogle
  module ErrorHandler
    def self.check(status)
      case status
      when 'REQUEST_DENIED'
        raise RequestDeniedError
      when 'INVALID_REQUEST'
        raise BadRequestError
      when 'OVER_QUERY_LIMIT'
        raise OverQueryError
      when 'UNKNOWN_ERROR'
        raise UnknownError
      end
    end
  end
end
