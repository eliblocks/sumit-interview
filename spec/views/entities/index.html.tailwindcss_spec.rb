require 'rails_helper'

RSpec.describe "entities/index", type: :view do

  let(:entities) { create_list(:entity, 2) }

  before(:each) do
    assign(:entities, entities)
  end

  it "renders a list of entities" do
    render

    assert_select 'div>p', text: Regexp.new("Name".to_s), count: 2
  end
end
