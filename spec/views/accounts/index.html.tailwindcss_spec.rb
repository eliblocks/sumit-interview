require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Plutus::Account.create!(
        name: "Cash",
        type: "Plutus::Asset"
      ),
      Plutus::Account.create!(
        name: "Accounts Payable",
        type: "Plutus::Liability"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Type".to_s), count: 2
  end
end
