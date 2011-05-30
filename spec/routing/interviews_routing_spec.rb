require "spec_helper"

describe InterviewsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/interviews" }.should route_to(:controller => "interviews", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/interviews/new" }.should route_to(:controller => "interviews", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/interviews/1" }.should route_to(:controller => "interviews", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/interviews/1/edit" }.should route_to(:controller => "interviews", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/interviews" }.should route_to(:controller => "interviews", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/interviews/1" }.should route_to(:controller => "interviews", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/interviews/1" }.should route_to(:controller => "interviews", :action => "destroy", :id => "1")
    end

  end
end
