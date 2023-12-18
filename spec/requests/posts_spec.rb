require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
  describe 'GET /show' do
    it 'should succeed' do
      get '/users/1/posts/1', params: { format: :html }
      expect(response).to have_http_status(:success)
      expect(response).to render_template('posts/show')
    end
  end
end
