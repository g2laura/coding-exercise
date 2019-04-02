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

  describe 'PUT #update' do
    let(:new_attributes) {
      FactoryGirl.attributes_for(:offer,
        season:    2018,
        quantity:  400,
        price:     900,
        seller_id: 1,
        grade:     'APW1'
      )
    }

    it 'updates the offer' do
      put :update, params: { id: offer.to_param, offer: new_attributes }
      expect(response.status).to eq(200)
      expect(assigns(:offer).season).to eq(2017) # Season can't be updated
      expect(assigns(:offer).quantity).to eq(400)
      expect(assigns(:offer).price).to eq(900)
      expect(assigns(:offer).seller_id).to eq(1)
      expect(assigns(:offer).grade).to eq('APW1')
    end

    it 'does not update if quantity is greater than 500' do
      put :update, params: { id: offer.to_param, offer: {quantity: 600} }
      expect(response.status).to eq(422)
    end

    it 'does not update if price is greater than 1000' do
      put :update, params: { id: offer.to_param, offer: {price: 2000} }
      expect(response.status).to eq(422)
    end
  end
end
