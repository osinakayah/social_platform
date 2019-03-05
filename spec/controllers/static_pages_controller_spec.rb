require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #index" do
    it "returns http redirect" do

      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET #success' do
    login_user
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
