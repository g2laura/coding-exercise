require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  let(:offer) { FactoryGirl.create(:offer) }

  describe 'GET #index' do
    it 'assigns offers' do
      get :index
      expect(assigns(:offers)).to eq([offer])
    end
  end
end
