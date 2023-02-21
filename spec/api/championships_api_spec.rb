require 'rails_helper'

RSpec.describe 'Championships API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let(:jwt) { Auth::Helpers.generate_token(user) }
  let(:headers) {
    {
      'Authorization' => "#{jwt}"
    }
  }

  describe 'Create championships' do
    it 'requires name param' do
      post '/api/v1/championships', headers: headers
      expect(response).to have_http_status(400)
    end

    it 'creates championship' do
      expect(Championships::Create)
        .to receive(:call)
              .and_return(OpenStruct.new(result: Championship.create(name: 'Championship')))
      post '/api/v1/championships', params: { name: 'Championship' }, headers: headers
      expect(response).to have_http_status(201)
    end

    it 'returns championship' do
      expect(Championships::Create)
        .to receive(:call)
              .and_return(OpenStruct.new(result: Championship.create(name: 'Championship')))
      post '/api/v1/championships', params: { name: 'Championship' }, headers: headers
      json = JSON.parse(response.body)
      expect(json['name']).to eq('Championship')
    end
  end
end