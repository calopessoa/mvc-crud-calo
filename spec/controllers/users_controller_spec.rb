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

  context "GET #show" do
    let(:user) { create(:user) }

    it "should successfully render the edit page" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end

    it "where the correct ID is found" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to be_a(User)
      expect(assigns(:user)).to eq(user)
    end

  end

  context "GET #new" do
    it "successfully renders the new user page" do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it "must have a new user" do
      get :new
      expect(assigns(:user)).to be_a(User)
      expect(assigns(:user)).to be_a_new(User)
    end

  end

  context "POST #create" do
    let!(:params) {
      { name: 'Mary Sue', email: 'marysue@email.com'}
    }
    it "successfully creates a new user" do
      post :create, params: { user: params }
      expect(flash[:notice]).to eq("User was successfully created.")
    end

  end
end