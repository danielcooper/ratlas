
module Ratlas
  class Discover

    include ::Ratlas::Queryable

    @resource_name = 'discover'
    
    def self.resource_name
      @resource_name
    end
    
    def self.resource_key
      'contents'
    end

  end
end