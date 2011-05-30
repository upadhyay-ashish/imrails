require 'spec_helper'

describe "attachments/show.html.erb" do
  before(:each) do
    @attachment = assign(:attachment, stub_model(Attachment,
      :interview_id => 1,
      :data_file_name => "Data File Name",
      :data_content_type => "Data Content Type",
      :data_file_size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Data File Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Data Content Type/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
