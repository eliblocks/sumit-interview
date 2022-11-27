require 'rails_helper'

RSpec.describe "entities/show", type: :view do
  let(:entity) { create(:entity) }

  before(:each) do
    assign(:entity, entity)
  end

  it "renders attributes in <p>" do
    render

    expect(rendered).to match(/Name/)
  end
end
