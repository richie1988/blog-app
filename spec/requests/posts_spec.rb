# spec/requests/posts_spec.rb
require 'rails_helper'

RSpec.describe 'Posts Controller', type: :request do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  describe 'GET /index' do
    it "Redirects to the posts' list page" do
      get user_posts_path(user)
      expect(response).to render_template(:index)
      expect(response.body).to include('<title>BlogApp</title>')
    end

    it 'GET /users/:user_id/posts/:id should succeed' do
      get user_post_path(user, post)
      expect(response.status).to eq(200)
    end

    it 'does not render a different template' do
      get user_posts_path(user)
      expect(response).to_not render_template(:show)
    end
  end

  describe 'GET /show' do
    it 'Redirects to the post details page' do
      get user_post_path(user, post)
      expect(response).to render_template(:show)
      expect(response.body).to include('<p>Post content goes here.</p>')
    end

    it 'GET /users/:user_id/posts/:id should succeed' do
      get user_post_path(user, post)
      expect(response.status).to eq(200)
    end

    it 'does not render a different template' do
      get user_post_path(user, post)
      expect(response).to_not render_template(:index)
    end
  end
end
