
module Ratlas
  class Schedule

    include ::Ratlas::Queryable

    @@resource_name = 'schedule.json'
    
    def self.resource_name
      @@resource_name
    end

  end
end