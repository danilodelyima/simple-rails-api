require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  let!(:brand) { create(:brand) }
  let!(:user) { create(:user) }
  let(:valid_attributes) { { user_id: user.id, brand_id: brand.id } }
  let(:invalid_attributes) { { user_id: 0, brand_id: 0 } }

  describe 'POST /relationships' do

    context 'when the request is valid' do

      before { post '/relationships', params: valid_attributes }

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the request does not exist' do

      before { post '/relationships', params: invalid_attributes }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end

  end

end