require 'spec_helper'

describe Attachment do
  it "can be instantiated" do
    Attachment.new.should be_an_instance_of(Attachment)
  end

  it "can be saved successfully" do
    Attachment.create.should be_persisted
  end
end
