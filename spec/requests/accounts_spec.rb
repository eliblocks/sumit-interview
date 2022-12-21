require 'rails_helper'

RSpec.describe "/accounts", type: :request do
  
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }


  shared_examples "a web api with a successful response" do
    it "renders a successful response" do
      subject

      expect(response).to be_successful
    end
  end

  describe "GET /index" do
    let!(:accounts) { create_list(:account, 2) }

    subject { get accounts_url }

    it_behaves_like "a web api with a successful response"
  end

  describe "GET /show" do
    let(:account) { create(:account) }

    subject { get account_url(account) }

    it_behaves_like "a web api with a successful response"
  end

  describe "GET /new" do
    subject { get new_account_url }

    it_behaves_like "a web api with a successful response"
  end

  describe "GET /edit" do
    let(:account) { create(:account) }

    subject { get edit_account_url(account) }

    it_behaves_like "a web api with a successful response"
  end

  describe "POST /create" do
    subject { post accounts_url, params: { account: attributes } }

    context "with valid parameters" do
      let(:attributes) {{ name: "Cash", type: "Plutus::Asset" }}

      it "creates a new Account" do
        expect { subject }.to change(Plutus::Account, :count).by(1)
      end

      it "redirects to the created account" do
        subject

        expect(response).to redirect_to(account_url(Plutus::Account.last))
      end
    end

    context "with invalid parameters" do
      let(:attributes) {{ name: "", type: "Plutus::Asset" }}

      it "does not create a new Account" do
        expect { subject }.not_to change(Plutus::Account, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    let(:account) { create(:account) }

    subject { patch account_url(account), params: { account: attributes } }

    context "with valid parameters" do
      let(:attributes) {{ name: "Furniture" }}

      it "updates the requested account" do
        subject

        expect(account.becomes(Plutus::Account).reload.name).to eq("Furniture")
      end

      it "redirects to the account" do
        subject

        expect(response).to redirect_to(account_url(account))
      end
    end

    context "with invalid parameters" do
      let(:attributes) {{ name: "" }}
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with a new account type" do
      let(:attributes) {{ type: "Plutus::Liability" }}

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when there are already entries in the account" do
      let(:attributes) {{ type: "Plutus::Liability" }}

      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        subject

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:account) { create(:account) }

    subject { delete account_url(account) }
    it "destroys the requested account" do
       expect { subject }.to change(Plutus::Account, :count).by(-1)
    end

    it "redirects to the accounts list" do
      subject

      expect(response).to redirect_to(accounts_url)
    end
  end
end
