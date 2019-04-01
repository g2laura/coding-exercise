require 'rails_helper'

RSpec.describe OffersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/offers').to route_to('offers#index')
    end
  end
end
