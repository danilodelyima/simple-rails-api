require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let!(:brand) { create(:brand) }
  let!(:products) { create_list(:product, 20, brand_id: brand.id) }
  let(:brand_id) { brand.id }
  let(:id) { products.first.id }

  describe 'GET brands/:brand_id/products' do

    before { get "/brands/#{brand_id}/products" }

    context 'when brand exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all products' do
        expect(json.size).to eq(20)
      end
    end

    context 'when brand does not exists' do
      let(:brand_id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'GET brands/:brand_id/products/:id' do
    before { get "/brands/#{brand_id}/products/#{id}" }

    context 'when product exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the product' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when product does not exists' do
      let(:id) { 0 }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /brands/:brand_id/items' do

    context 'when request attributes are valid' do
      let(:product) { {name: 'Nitro Cold Brew', brand_id: brand_id } }

      before { post "/brands/#{brand_id}/products", params: product }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/brands/#{brand_id}/products", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end


  describe 'PUT /brands/:brand_id/products/:id' do
    let(:product) { { name: 'Vanilla Sweet Cream Cold Brew' } }

    before { put "/brands/#{brand_id}/products/#{id}", params: product }

    context 'when product exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the item' do
        product = Product.find(id)
        expect(product.name).to match('Vanilla Sweet Cream Cold Brew')
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
