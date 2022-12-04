require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  context "GET #index" do
    it "should successfully render index page" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it "should return an empty array" do
      get :index
      expect(assigns(:users)).to be_empty
    end

    it "should have at least one user" do
      create(:user)
      get :index
      expect(assigns(:users)).to_not be_empty
    end

  end
end