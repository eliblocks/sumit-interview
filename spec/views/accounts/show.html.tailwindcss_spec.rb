require 'rails_helper'

RSpec.describe "accounts/show", type: :view do
  before(:each) do
    assign(:account, Plutus::Account.create!(
      name: "Cash",
      type: "Plutus::Asset"
    ).becomes(Account))
  end

  # it "renders attributes in <p>" do
  #   render
  #   expect(rendered).to match(/Name/)
  #   expect(rendered).to match(/Type/)
  # end
end
