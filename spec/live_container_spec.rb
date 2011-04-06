require './lib/ratlas'
require 'rspec'
require 'rspec-expectations'



describe Ratlas::Discover do
  
  context "when used" do
    
    it "should be able to tell me about drama on the bbc" do
      
      Ratlas::Discover.find(:genre => 'drama').and(:publisher => 'bbc.co.uk').each do |n|
        n.title.class.should == String
      end
    end
    
  end
  
end


describe Ratlas::Search do
  
  context "when used" do
    
    it "should be able to tell glee" do
      
      Ratlas::Search.find(:q => 'glee').each do |n|
        n.title.class.should == String
      end
      
    end
    
  end
  
end


describe Ratlas::Content do
  
  context "when used" do
    
    it "should be able to tell me about a url" do
      
      Ratlas::Content.find(:uri => 'http://www.bbc.co.uk/programmes/b00zf9j6').each do |n|
        n.title.class.should == String
      end
    end
    
  end
  
end