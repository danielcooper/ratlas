
module Ratlas
  class Schedule

    include ::Ratlas::Queryable

    @@resource_name = 'schedule'
    
    def self.resource_name
      @@resource_name
    end
    
     def self.resource_key
      'schedule'
    end

  end
end