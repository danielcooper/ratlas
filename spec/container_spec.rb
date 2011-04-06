require './lib/ratlas'
require 'rspec'
require 'rspec-expectations'

module Ratlas
  class Query
    
    def request
      JSON.parse(File.open("spec/fixtures/content.json").read)
    end
    
  end
end



describe Ratlas::Discover do
  
  context "when searching" do
    
    it "returns a query object on find" do
      Ratlas::Discover.find(:test => 'why_not').class.should == Ratlas::Query
    end
    
    it "should provide a chainable search" do
      container = Ratlas::Discover.find(:all).where(:arg1 => 'test').and(:arg2 => "test2")
      container.to_params.include?("arg1=test&arg2=test2").should == true
    end
    
    it "should camelCase keys" do
      container = Ratlas::Discover.find(:all).where(:arg_one => 'test').and(:arg_two => "test2")
      container.to_params.include?("argOne=test&argTwo=test2").should == true
    end
    
    it "should produce a queryable url" do
      container = Ratlas::Discover.find(:all).where(:arg_one => 'test').and(:arg_two => "test2")
      container.to_uri.to_s.include?("atlasapi.org/3.0/discover.json?argOne=test&argTwo=test2").should == true
    end
    
    context "and returning results" do
      
      it "should return some results" do
        Ratlas::Discover.find(:all).where(:arg_one => 'test').and(:arg_two => "test2").execute.class.should == Ratlas::Response
      end
      
      it "should be itterable" do
        Ratlas::Discover.find(:all).where(:arg_one => 'test').and(:arg_two => "test2").each do |n|
          n.class.should == Hashie::Mash
           ["audio", "video"].include?(n.media_type).should == true
        end
        
      end
      
    end
    
  end
  
end