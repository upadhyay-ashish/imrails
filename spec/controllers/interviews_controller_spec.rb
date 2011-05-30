require 'spec_helper'

describe InterviewsController do

  def mock_interview(stubs={})
    (@mock_interview ||= mock_model(Interview).as_null_object).tap do |interview|
      interview.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all interviews as @interviews" do
      Interview.stub(:all) { [mock_interview] }
      get :index
      assigns(:interviews).should eq([mock_interview])
    end
  end

  describe "GET show" do
    it "assigns the requested interview as @interview" do
      Interview.stub(:find).with("37") { mock_interview }
      get :show, :id => "37"
      assigns(:interview).should be(mock_interview)
    end
  end

  describe "GET new" do
    it "assigns a new interview as @interview" do
      Interview.stub(:new) { mock_interview }
      get :new
      assigns(:interview).should be(mock_interview)
    end
  end

  describe "GET edit" do
    it "assigns the requested interview as @interview" do
      Interview.stub(:find).with("37") { mock_interview }
      get :edit, :id => "37"
      assigns(:interview).should be(mock_interview)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created interview as @interview" do
        Interview.stub(:new).with({'these' => 'params'}) { mock_interview(:save => true) }
        post :create, :interview => {'these' => 'params'}
        assigns(:interview).should be(mock_interview)
      end

      it "redirects to the created interview" do
        Interview.stub(:new) { mock_interview(:save => true) }
        post :create, :interview => {}
        response.should redirect_to(interview_url(mock_interview))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved interview as @interview" do
        Interview.stub(:new).with({'these' => 'params'}) { mock_interview(:save => false) }
        post :create, :interview => {'these' => 'params'}
        assigns(:interview).should be(mock_interview)
      end

      it "re-renders the 'new' template" do
        Interview.stub(:new) { mock_interview(:save => false) }
        post :create, :interview => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested interview" do
        Interview.should_receive(:find).with("37") { mock_interview }
        mock_interview.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :interview => {'these' => 'params'}
      end

      it "assigns the requested interview as @interview" do
        Interview.stub(:find) { mock_interview(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:interview).should be(mock_interview)
      end

      it "redirects to the interview" do
        Interview.stub(:find) { mock_interview(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(interview_url(mock_interview))
      end
    end

    describe "with invalid params" do
      it "assigns the interview as @interview" do
        Interview.stub(:find) { mock_interview(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:interview).should be(mock_interview)
      end

      it "re-renders the 'edit' template" do
        Interview.stub(:find) { mock_interview(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested interview" do
      Interview.should_receive(:find).with("37") { mock_interview }
      mock_interview.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the interviews list" do
      Interview.stub(:find) { mock_interview }
      delete :destroy, :id => "1"
      response.should redirect_to(interviews_url)
    end
  end

end
