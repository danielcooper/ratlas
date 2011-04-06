require './lib/ratlas'
require 'rspec'
require 'rspec-expectations'



describe Ratlas do

    it "has an endpoint" do
      Ratlas::ENDPOINT.class.should == String
    end
  
end