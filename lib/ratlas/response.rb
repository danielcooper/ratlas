
module Ratlas
  class Response < Array
    
    def initialize(json)
      super(json["contents"].map{|j| Hashie::Mash.new(j)})
    end
        
  end
end