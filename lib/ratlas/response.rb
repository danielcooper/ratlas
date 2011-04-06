
module Ratlas
  class Response < Array
    
    def initialize(json, as)
      super(json[as].map{|j| Hashie::Mash.new(j)})
    end
        
  end
end