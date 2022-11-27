require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /show" do
    subject { get root_path }

    it 'renders the home page' do
      subject

      expect(response).to be_successful
    end
  end
end
