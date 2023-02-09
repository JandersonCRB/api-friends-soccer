require 'rails_helper'

RSpec.describe Auth::ResetPassword, type: :service do
  let(:user) { create(:user) }
  let(:password_reset) { create(:password_reset, user: user, token: "reset_token") }
  let(:params) {
    {
      token: password_reset.token,
      password: 'new_password',
      password_confirmation: 'new_password',
    }
  }

  context 'token does not exist' do
    before do
      params[:token] = 'wrong_token'
    end

    it 'should raise NotFoundError' do
      expect do
        described_class.call(params)
      end.to raise_error(Exceptions::CustomError, Exceptions::ErrorMessages::INVALID_TOKEN)
    end
  end

  context 'token is expired' do
    before do
      password_reset.update(expires_at: Time.now - 1.day)
    end

    it 'should raise TOKEN_EXPIRED Error' do
      expect do
        described_class.call(params)
      end.to raise_error(Exceptions::CustomError, Exceptions::ErrorMessages::TOKEN_EXPIRED)
    end
  end

  context 'passwords do not match' do
    before do
      params[:password_confirmation] = 'wrong_confirmation'
    end

    it 'should raise PASSWORD_MISMATCH Error' do
      expect do
        described_class.call(params)
      end.to raise_error(Exceptions::CustomError, Exceptions::ErrorMessages::PASSWORD_MISMATCH)
    end
  end

  context 'valid token' do
    it 'should change the password' do
      described_class.call(params)
      expect(user.reload.authenticate(params[:password])).to be_truthy
    end
  end
end