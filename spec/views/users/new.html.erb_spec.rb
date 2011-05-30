require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :firstname => "MyString",
      :lastname => "MyString",
      :username => "MyString",
      :email => "MyString",
      :password => "MyString",
      :address => "MyString",
      :phone_number => "MyString",
      :role => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_firstname", :name => "user[firstname]"
      assert_select "input#user_lastname", :name => "user[lastname]"
      assert_select "input#user_username", :name => "user[username]"
      assert_select "input#user_email", :name => "user[email]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_address", :name => "user[address]"
      assert_select "input#user_phone_number", :name => "user[phone_number]"
      assert_select "input#user_role", :name => "user[role]"
    end
  end
end
