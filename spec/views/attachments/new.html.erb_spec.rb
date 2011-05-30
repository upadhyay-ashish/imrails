require 'spec_helper'

describe "attachments/new.html.erb" do
  before(:each) do
    assign(:attachment, stub_model(Attachment,
      :interview_id => 1,
      :data_file_name => "MyString",
      :data_content_type => "MyString",
      :data_file_size => 1
    ).as_new_record)
  end

  it "renders new attachment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => attachments_path, :method => "post" do
      assert_select "input#attachment_interview_id", :name => "attachment[interview_id]"
      assert_select "input#attachment_data_file_name", :name => "attachment[data_file_name]"
      assert_select "input#attachment_data_content_type", :name => "attachment[data_content_type]"
      assert_select "input#attachment_data_file_size", :name => "attachment[data_file_size]"
    end
  end
end
