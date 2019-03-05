require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "Post Routing" do
    login_user
    it "routees #index" do
      expect(get: '/posts').to route_to('posts#index')
    end
  end

  describe 'Post controller request specs when signed in' do
    login_user
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template :index
    end
  end

  describe 'Post controller request specs when not signed in' do
    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

end
