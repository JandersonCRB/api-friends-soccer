require 'rails_helper'

RSpec.describe Championships::ListParticipating do
  let(:user) { create(:user) }
  let(:params) { {} }
  let(:decoded_token) {
    {
      :user_id => user.id,
      :roles => [],
      :privileges => %w[LIST_CHAMPIONSHIPS]
    }
  }

  context "when user is not participating in any championship" do
    it 'returns empty array' do
      result = described_class.call(decoded_token, params).result

      expect(result).to eq([])
    end
  end

  context "when there are championships, but user is not participating" do
    let!(:championship) { create(:championship, owner_id: create(:user).id) }

    it 'returns empty array' do
      result = described_class.call(decoded_token, params).result

      expect(result).to eq([])
    end
  end

  context "when user is owner of a championship" do
    let!(:championship) { create(:championship, owner_id: user.id) }
    it 'returns championships user is participating in' do
      result = described_class.call(decoded_token, params).result

      expect(result.size).to eq(1)
      expect(result[0]).to eq(championship)
    end
  end

  context "when user is manager of a championship" do
    let!(:championship) { create(:championship) }
    let!(:manager) { create(:championships_manager, championship: championship, user: user) }

    it 'returns championships user is participating in' do
      result = described_class.call(decoded_token, params).result

      expect(result.size).to eq(1)
      expect(result[0]).to eq(championship)
    end
  end

  context "when user is player in a championship" do
    let!(:championship) { create(:championship) }
    let!(:player) { create(:player, championship: championship, user: user) }

    it 'returns championships user is participating in' do
      result = described_class.call(decoded_token, params).result

      expect(result.size).to eq(1)
      expect(result[0]).to eq(championship)
    end
  end

  context "when user is owner and manager of a championship" do
    let!(:championship) { create(:championship, owner_id: user.id) }
    let!(:manager) { create(:championships_manager, championship: championship, user: user) }

    it 'returns championships user is participating in' do
      result = described_class.call(decoded_token, params).result

      expect(result.size).to eq(1)
      expect(result[0]).to eq(championship)
    end
  end

end