require 'rails_helper'

RSpec.describe "entities/edit", type: :view do
  let(:entity) { create(:entity) }

  before(:each) do
    assign(:entity, entity)
  end

  it "renders the edit entity form" do
    render

    assert_select "form[action=?][method=?]", entity_path(entity), "post" do
      assert_select "input[name=?]", "entity[name]"
    end
  end
end
