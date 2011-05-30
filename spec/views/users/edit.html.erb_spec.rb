require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :new_record? => false,
      :firstname => "MyString",
      :lastname => "MyString",
      :username => "MyString",
      :email => "MyString",
      :password => "MyString",
      :address => "MyString",
      :phone_number => "MyString",
      :role => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => user_path(@user), :method => "post" do
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
