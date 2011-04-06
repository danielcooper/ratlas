
module Ratlas
  class Content

    include ::Ratlas::Queryable

    @resource_name = 'content'
    @exclude_list = [:limit]
    
    
    def self.resource_name
      @resource_name
    end
    
    def self.resource_key
      @resource_name + 's'
    end
    
    def self.exclude
      @exclude_list
    end

  end
end