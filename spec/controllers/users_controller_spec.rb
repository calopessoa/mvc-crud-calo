require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  context "GET #index" do
    it "should successfully render index page" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end