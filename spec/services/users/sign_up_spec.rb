require 'rails_helper'

RSpec.describe Users::SignUp, type: :service do
  let(:params) do
    {
      first_name: 'John',
      last_name: 'Doe',
      email: 'johndoe@familiaemcampo.com',
      password: '123456'
    }
  end

  context "success" do
    it "creates a new user" do
      expect do
        described_class.call(params)
      end.to change { User.count }.by(1)
    end

    it "returns the user" do
      user = described_class.call(params).result
      expect(user).to be_a(User)
    end

    it "returns the user with the correct attributes" do

    end

  end
end