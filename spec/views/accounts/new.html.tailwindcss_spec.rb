require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Plutus::Account.new(
      name: "Cash",
      type: "Plutus::Asset"
    ).becomes(Account))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input[name=?]", "account[name]"

      assert_select "select[name=?]", "account[type]"
    end
  end
end
