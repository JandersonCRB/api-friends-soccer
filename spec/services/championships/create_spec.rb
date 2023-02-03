require 'rails_helper'

RSpec.describe Championships::Create, type: :services do
  let(:user) { create(:user) }

  let(:decoded_token) {
    {
      user_id: user.id,
      roles: ['ADMIN'],
      privileges: ['CREATE_CHAMPIONSHIP'],
    }
  }

  let(:params) {
    {
      name: 'Championship name',
    }
  }

  it 'creates a championship' do
    described_class.call(decoded_token, params)
    expect(Championship.count).to eq(1)
  end

  it 'creates a championship with the correct name' do
    described_class.call(decoded_token, params)
    expect(Championship.first.name).to eq(params[:name])
  end

  it 'creates a championship with the correct owner' do
    described_class.call(decoded_token, params)
    expect(Championship.first.user).to eq(user)
  end

  it 'returns the championship' do
    championship = described_class.call(decoded_token, params).result
    expect(championship.id).to eq(Championship.first.id)
  end

  it 'raises an error if the championship is not valid' do
    params[:name] = nil
    expect do
      described_class.call(decoded_token, params)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'created ChampionshipManager' do
    described_class.call(decoded_token, params)
    expect(ChampionshipsManager.count).to eq(1)
  end

  it 'created ChampionshipManager with correct championship' do
    described_class.call(decoded_token, params)
    expect(ChampionshipsManager.first.championship).to eq(Championship.first)
  end

  it 'created ChampionshipManager with correct user' do
    described_class.call(decoded_token, params)
    expect(ChampionshipsManager.first.user).to eq(user)
  end

  describe 'Authority' do
    before do
      decoded_token[:privileges] = []
    end

    it 'raises an error if the user does not have the privilege' do
      expect do
        described_class.call(decoded_token, params)
      end.to raise_error(Exceptions::CustomError)
    end
  end
end