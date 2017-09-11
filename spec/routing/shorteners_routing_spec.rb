require 'rails_helper'

RSpec.describe ShortenersController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/').to route_to('shorteners#new')
    end

    it 'routes to #redirect' do
      expect(get: '/abc123').to route_to('shorteners#redirect', url: 'abc123')
    end

    it 'routes to #create' do
      expect(post: '/').to route_to('shorteners#create')
    end
  end
end
