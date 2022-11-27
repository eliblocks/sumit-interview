require 'rails_helper'

RSpec.describe "/entities", type: :request do
  let(:valid_attributes) { { name: 'Some LLC' } }
  let(:invalid_attributes) { { name: nil } }

  shared_examples "a web api with a successful response" do
    it "renders a successful response" do
      subject

      expect(response).to be_successful
    end
  end

  describe "GET /index" do
    let!(:entities) { create_list(:entity, 2) }

    subject { get entities_url }

    it_behaves_like "a web api with a successful response"
  end

  describe "GET /show" do
    let(:entity) { create(:entity) }

    subject { get entity_url(entity) }

    it_behaves_like "a web api with a successful response"
  end

  describe "GET /new" do
    subject { get new_entity_url }

    it_behaves_like "a web api with a successful response"
  end

  describe "GET /edit" do
    let(:entity) { create(:entity) }

    subject { get edit_entity_url(entity) }

    it_behaves_like "a web api with a successful response"
  end

  describe "POST /create" do
    subject { post entities_url, params: { entity: attributes } }

    context "with valid parameters" do
      let(:attributes) { valid_attributes }

      it "creates a new Entity" do
        expect { subject }.to change(Entity, :count).by(1)
      end

      it "redirects to the created entity" do
        subject

        expect(response).to redirect_to(entity_url(Entity.last))
      end
    end

    context "with invalid parameters" do
      let(:attributes) { invalid_attributes }

      it "does not create a new Entity" do
        expect { subject }.not_to change(Entity, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    let(:entity) { create(:entity) }

    subject { patch entity_url(entity), params: { entity: attributes } }

    context "with valid parameters" do
      let(:attributes) { { name: 'A new LLC' } }

      it "updates the requested entity" do
        subject

        entity.reload

        expect(entity.name).to eq('A new LLC')
      end

      it "redirects to the entity" do
        subject

        expect(response).to redirect_to(entity_url(entity))
      end
    end

    context "with invalid parameters" do
      let(:attributes) { { name: '' } }

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:entity) { create(:entity) }

    subject { delete entity_url(entity) }

    it "destroys the requested entity" do
      expect { subject }.to change(Entity, :count).by(-1)
    end

    it "redirects to the entities list" do
      subject

      expect(response).to redirect_to(entities_url)
    end
  end
end
