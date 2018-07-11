require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user) { users.first }
  let(:id) { users.first.id }

  describe 'GET /users' do
    before { get '/users' }

    it 'returns brands' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do

    before { get "/users/#{id}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
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

  describe 'POST /users' do

    context 'when the request is valid' do
      before { post '/users', params: user.as_json }

      it 'creates a user' do
        expect(json['name']).to eq(user.name)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /users/:id' do
    let(:user) { { name: 'Bob' } }

    context 'when the record exists' do
      before { put "/users/#{id}", params: user.as_json }

      it 'updates the record' do
        expect(json['name']).to eq('Bob')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
