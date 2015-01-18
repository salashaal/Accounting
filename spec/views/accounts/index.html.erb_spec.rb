require 'rails_helper'

RSpec.describe "accounts/index", :type => :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :account_number => "Account Number",
        :account_type => "Account Type",
        :balance_type => "Balance Type",
        :user => nil
      ),
      Account.create!(
        :account_number => "Account Number",
        :account_type => "Account Type",
        :balance_type => "Balance Type",
        :user => nil
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "Account Number".to_s, :count => 2
    assert_select "tr>td", :text => "Account Type".to_s, :count => 2
    assert_select "tr>td", :text => "Balance Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
