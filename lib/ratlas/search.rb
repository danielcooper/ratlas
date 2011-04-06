
module Ratlas
  class Search

    include ::Ratlas::Queryable

    @@resource_name = 'search.json'
    
    def self.resource_name
      @@resource_name
    end

  end
end