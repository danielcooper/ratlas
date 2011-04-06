
module Ratlas
  class Discover

    include ::Ratlas::Queryable

    @@resource_name = 'discover.json'
    
    def self.resource_name
      @@resource_name
    end

  end
end