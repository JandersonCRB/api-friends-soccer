# frozen_string_literal: true

RSpec.describe AuthController do
  describe 'Login' do
    context 'with wrong credentials' do
      it 'assigns @teams' do
        team = Team.create
        get :index
        expect(assigns(:teams)).to eq([team])
      end
    end
  end
end
