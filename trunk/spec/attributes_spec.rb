require File.dirname(__FILE__) + '/spec_helper.rb'

class Person < ActiveCouch::Base
  has :name
end
class PersonWithName < ActiveCouch::Base
  has :name, :with_default_value => "John Doe"
end
class PersonWithTelephones < ActiveCouch::Base
  has_many :telephones
end

describe "An object created as a subclass of ActiveCouch::Base with one text attribute" do
  before(:each) do
    @person = Person.new
  end
  it "should create an empty instance variable when sent #has with a symbol as parameter" do
    @person.name.should == ""
  end
end

describe "An object created as a subclass of ActiveCouch::Base with one text attribute (with default value set)" do
  before(:each) do
    @person_with_name = PersonWithName.new
  end
  
  it "should create an instance variable with the correct default value set when sent #has with a symbol as parameter" do
    @person_with_name.name.should == "John Doe"
  end
end

describe "An object created as a subclass of ActiveCouch::Base with one array attribute" do
  before(:each) do
    @person_with_tels = PersonWithTelephones.new
  end
  
  it "should create an instance variable which is an empty array" do
    @person_with_tels.telephones.class.should == Array
    @person_with_tels.telephones.size.should == 0
  end
end