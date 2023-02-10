require 'rails_helper'

describe Users::Create, type: :service do
  let(:decoded_token) {
    {
      user_id: 1,
      roles: ['ADMIN'],
      privileges: []
    }
  }

  let(:params) {
    {
      email: 'user@fs.com',
      password: 'password',
      first_name: 'user',
      last_name: 'fs'
    }
  }

  context 'user does not exist' do
    it 'should not raise error' do
      expect do
        described_class.call(decoded_token, params)
      end.not_to raise_error
    end

    it 'should championships user' do
      expect do
        described_class.call(decoded_token, params)
      end.to change(User, :count).by(1)
    end

    it 'should return user' do
      result = described_class.call(decoded_token, params).result
      expect(result).not_to be_nil
    end
  end

  context 'user exists' do
    let!(:user) {
      create(:user, email: params[:email])
    }

    it 'should raise error' do
      expect do
        described_class.call(decoded_token, params)
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'user is not admin' do
    before do
      decoded_token[:roles] = []
    end

    it 'should raise error' do
      expect do
        described_class.call(decoded_token, params)
      end.to raise_error(Exceptions::CustomError, Exceptions::ErrorMessages::AUTHORITY_ERROR)
    end
  end
end