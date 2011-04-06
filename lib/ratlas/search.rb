
module Ratlas
  class Search

    include ::Ratlas::Queryable

    @@resource_name = 'search'
    
    def self.resource_name
      @@resource_name
    end
    
     def self.resource_key
      'contents'
    end

  end
end