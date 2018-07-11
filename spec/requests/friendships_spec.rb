require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  let!(:friend) { create(:user) }
  let!(:user) { create(:user) }
  let(:valid_attributes) { { user_id: user.id, friend_id: friend.id } }
  let(:invalid_attributes) { { user_id: 0, friend_id: 0 } }

  describe 'POST /friendships' do

    context 'when the request is valid' do

      before { post '/friendships', params: valid_attributes }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the request is invalid' do

      before { post '/friendships', params: invalid_attributes }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end

  end

end