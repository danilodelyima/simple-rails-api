require 'rails_helper'

RSpec.describe "Brands", type: :request do
  let!(:brands) { create_list(:brand, 10) }
  let(:id) { brands.first.id }

  describe 'GET /brands' do

    before { get '/brands' }

    it 'returns brands' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "includes products key" do
      expect(json.first).to have_key("products")
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'GET /brands/:id' do

    before { get "/brands/#{id}" }

    context 'when the record exists' do
      it 'returns the brand' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it "includes products key" do
        expect(json).to have_key("products")
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /brands' do

    let(:brand) { { name: 'Starbucks' } }

    context 'when the request is valid' do
      before { post '/brands', params: brand }

      it 'creates a brand' do
        expect(json['name']).to eq('Starbucks')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/brands', params: { name: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /brands/:id' do
    let(:brand) { { name: 'Apple' } }

    context 'when the request is valid' do
      before { put "/brands/#{id}", params: brand }

      it 'updates the record' do
        expect(json['name']).to eq('Apple')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { put "/brands/#{id}", params: { name: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
