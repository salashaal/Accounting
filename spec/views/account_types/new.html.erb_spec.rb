require 'rails_helper'

RSpec.describe "account_types/new", :type => :view do
  before(:each) do
    assign(:account_type, AccountType.new(
      :account_type => "MyString"
    ))
  end

  it "renders new account_type form" do
    render

    assert_select "form[action=?][method=?]", account_types_path, "post" do

      assert_select "input#account_type_account_type[name=?]", "account_type[account_type]"
    end
  end
end
