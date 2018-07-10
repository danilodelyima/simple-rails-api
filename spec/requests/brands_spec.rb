require 'rails_helper'

RSpec.describe "Brands", type: :request do
  let!(:brands) { create_list(:brand, 10) }
  let(:brand_id) { brands.first.id }

  describe "GET /brands" do

    before { get "/brands" }

    it "returns brands" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end


  describe "GET /brands/:id" do

    before { get "/brands/#{brand_id}" }

    context 'when the record exists' do
      it 'returns the brand' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(brand_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:brand_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      # it 'returns a not found message' do
      #   expect(response.body).to match(/Couldn't find Todo/)
      # end
    end
  end
end