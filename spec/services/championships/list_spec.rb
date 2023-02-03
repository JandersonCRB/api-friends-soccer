require 'rails_helper'

RSpec.describe Championships::List, type: :services do
  let(:user) { create(:user) }

  let(:decoded_token) {
    {
      user_id: user.id,
      roles: ['ADMIN'],
      privileges: ['LIST_CHAMPIONSHIPS'],
    }
  }

  let(:params) {
    {
      name: 'Championship name',
    }
  }

  describe 'Authority checks' do
    it 'raises an error if the user doesnt have LIST_CHAMPIONSHIPS privilege' do
      decoded_token[:privileges] = []
      expect do
        described_class.call(decoded_token, params)
      end.to raise_error(Exceptions::CustomError)
    end

    it 'does not raise an error if the user has LIST_CHAMPIONSHIPS privilege' do
      expect do
        described_class.call(decoded_token, params)
      end.not_to raise_error
    end

  end

  context 'has many championships' do
    let!(:championship1) { create(:championship, user: user) }
    let!(:championship2) { create(:championship, user: user) }

    it 'returns all championships' do
      championships = described_class.call(decoded_token, params).result
      expect(championships).to include(championship1)
      expect(championships).to include(championship2)
    end


  end
end