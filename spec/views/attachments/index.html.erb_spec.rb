require 'spec_helper'

describe "attachments/index.html.erb" do
  before(:each) do
    assign(:attachments, [
      stub_model(Attachment,
        :interview_id => 1,
        :data_file_name => "Data File Name",
        :data_content_type => "Data Content Type",
        :data_file_size => 1
      ),
      stub_model(Attachment,
        :interview_id => 1,
        :data_file_name => "Data File Name",
        :data_content_type => "Data Content Type",
        :data_file_size => 1
      )
    ])
  end

  it "renders a list of attachments" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Data File Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Data Content Type".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
