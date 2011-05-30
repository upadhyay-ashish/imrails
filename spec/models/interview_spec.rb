require 'spec_helper'

describe Interview do
  before {interview.name}
  it "can be instantiated" do
    Interview.new.should be_an_instance_of(Interview)
  end

  it "can be saved successfully" do
    Interview.create.should be_persisted
  end 
  
end
