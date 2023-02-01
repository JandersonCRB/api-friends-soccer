require 'rails_helper'

describe Auth::Login, type: :service do
  let(:params) {
    {
      email: 'email@email.com',
      password: 'password'
    }
  }

  context 'user does not exist' do
    it 'should raise NotFoundError' do
      expect do
        described_class.call(params)
      end.to raise_error(Exceptions::CustomError, Exceptions::ErrorMessages::WRONG_CREDENTIALS)
    end
  end

  context 'user exists' do
    let!(:user) {
      create(:user, email: params[:email], password: params[:password])
    }

    it 'should not raise error' do
      expect do
        described_class.call(params)
      end.not_to raise_error
    end

    it 'should return token' do
      result = described_class.call(params).result
      expect(result[:token]).not_to be_nil
    end

    it 'should return user' do
      result = described_class.call(params).result
      expect(result[:user]).not_to be_nil
      expect(result[:user].id).to eq(user.id)
    end

    context 'wrong password' do
      before do
        params[:password] = 'wrong_password'
      end

      it 'should raise WrongCredentials' do
        expect do
          described_class.call(params)
        end.to raise_error(Exceptions::CustomError, Exceptions::ErrorMessages::WRONG_CREDENTIALS)
      end
    end
  end
end