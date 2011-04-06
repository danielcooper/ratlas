module Ratlas
  module Queryable
    def self.included(base)
      base.extend(ClassMethods)

    end
    
    module ClassMethods
      
      def where(args)
        find(args)
      end
      
      def find(args)
        if args.is_a?(Symbol)
          Ratlas::Query.new(self, args)
        elsif args.is_a?(Hash)
          Ratlas::Query.new(self, :all, args)
        end
        
      end    
      
    end
    
  
    
    
  end
end