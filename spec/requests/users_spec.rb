require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:users) { create_list(:user, 10) }
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
end
