require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username",
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :description => "MyText"
      ),
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username",
        :email => "Email",
        :encrypted_password => "Encrypted Password",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Encrypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
