require 'spec_helper'

describe "interviews/index.html.erb" do
  before(:each) do
    assign(:interviews, [
      stub_model(Interview,
        :name => "Name",
        :total_exp => 1,
        :ror_exp => 1,
        :location => "Location",
        :result => "Result",
        :phoneNumber => "",
        :remarks => "MyText",
        :email => "MyText"
      ),
      stub_model(Interview,
        :name => "Name",
        :total_exp => 1,
        :ror_exp => 1,
        :location => "Location",
        :result => "Result",
        :phoneNumber => "",
        :remarks => "MyText",
        :email => "MyText"
      )
    ])
  end

  it "renders a list of interviews" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Result".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
