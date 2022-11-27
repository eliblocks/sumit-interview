require 'rails_helper'

RSpec.describe "entities/new", type: :view do
  let(:entity) { build(:entity) }

  before(:each) do
    assign(:entity, entity)
  end

  it "renders new entity form" do
    render

    assert_select "form[action=?][method=?]", entities_path, "post" do
      assert_select "input[name=?]", "entity[name]"
    end
  end
end
