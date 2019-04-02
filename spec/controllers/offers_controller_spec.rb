require 'rails_helper'

RSpec.describe OffersController, type: :controller do
  let(:offer) { FactoryGirl.create(:offer) }

  describe 'GET #index' do
    it 'assigns offers' do
      get :index
      expect(assigns(:offers)).to eq([offer])
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the offer' do
      delete :destroy, params: { id: offer.to_param }
      expect(response.status).to eq(200)
      expect(Offer.all.count).to eq(0)
    end
  end
end
