# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do
  describe 'List users' do
    context 'with one user' do
      before do
        create(:user)
      end

      it 'has one user' do
        headers = { 'ACCEPT' => 'application/json' }
        request.headers.merge!(headers)
        get :list
        expect(response).to have_http_status(:success)
        expect(response.body).not_to be_nil
        expect(JSON(response.body).size).to eq(1)
      end
    end
  end
end
