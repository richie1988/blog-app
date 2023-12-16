require 'rails_helper'

RSpec.describe 'Users Controller', type: :request do
  describe 'GET /index' do
    it "Redirects to the users' list page" do
      # Replace '1' with an actual user ID in your database
      get '/users/1/posts'
      expect(response).to render_template(:index)
      expect(response.body).to include('<title>BlogApp</title>')
    end

    it 'GET /users/id should succeed' do
      # Replace '1' with an actual user ID in your database
      get '/users/1'
      expect(response.status).to eq(200)
    end

    it 'does not render a different template' do
      get '/users'
      expect(response).to_not render_template(:show)
    end
  end

  describe 'GET /show' do
    it 'Redirects to the user profile page' do
      # Replace '1' with an actual user ID in your database
      get '/users/1'
      expect(response).to render_template(:show)
      expect(response.body).to include('<p>Teacher from Mexico.</p>')
    end

    it 'GET users/id should succeed' do
      # Replace '1' with an actual user ID in your database
      get '/users/1'
      expect(response.status).to eq(200)
    end

    it 'does not render a different template' do
      # Replace '1' with an actual user ID in your database
      get '/users/1'
      expect(response).to_not render_template(:index)
    end
  end
end
