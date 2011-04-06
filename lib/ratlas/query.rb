module Ratlas
  class Query

    def initialize(target, scope = :all, conditions = {})
      @target = target
      @scope = scope
      @conditions = {:limit => "50"}.merge(conditions)
      @conditions.delete_if{|k,v| @target.respond_to?(:exclude) && @target.exclude.include?(k)}
    end

    def where(conditions)
      raise "#where expects a conditions hash" unless conditions.is_a?(Hash)
      add_conditions(conditions)
      self
    end
    
    def each &block
      execute.each &block
    end
    
    def to_a
      execute.to_a
    end

    def and(conditions)
      where(conditions)
    end

    def limit(limit)
      add_condition(:limit => limit )
    end

    def to_params
      to_uri.query
    end

    def to_uri
      uri = Addressable::URI.new
      uri.host = Ratlas::ENDPOINT
      uri.path = Ratlas::ENDPOINT_VERSION + '/' + @target.resource_name
      uri.query_values = conditions_for_query
      uri
    end
    
    def request
      JSON.parse(Net::HTTP.get_response(URI.parse('http:'+to_uri.to_s)).body)
    end
    
    def execute
      Ratlas::Response.new(request)
    end

    protected

    def conditions_for_query
      output = {}
      @conditions.each{|k,v| output[k.to_s.camelize!(false)] = v}
      return output
    end

    def add_condition(key, value)
      @conditions[key.to_sym] = value.to_s
    end

    def add_conditions(conditions)
      conditions.each do |key, value|
        add_condition(key, value)
      end
    end
  end
end