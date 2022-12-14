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

    it "should successfully render the show page" do
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

  context "GET #edit" do
    let(:user) { create(:user) }
    it "successfully renders edit page" do
      get :edit, params: { id: user.id }
      expect(response).to render_template(:edit)
      expect(assigns(:user)).to be_a(User)
    end

  end

  context "POST #create" do
    let!(:params) {
      { name: 'Mary Sue', email: 'marysue@email.com'}
    }
    it "successfully creates a new user" do
      post :create, params: { user: params }
      expect(flash[:notice]).to eq("User was successfully created.")
      expect(response).to have_http_status(302)
    end

    it "fails to create a new user" do
      params = { name: 'Mary Sue' }
      post :create, params: { user: params }
      expect(flash[:notice]).to render_template(:new)
      expect(response).to have_http_status(422)
    end

  end

  context "PUT #update" do
    let!(:user) {
      create(:user)
    }
    it "successfully updates a existing user" do
      params = { name: "User was successfully updated."}
      put :update, params: { id: user.id, user: params }
      user.reload
      expect(user.name).to eq(params[:name])
      expect(flash[:notice]).to eq("User was successfully updated.")
      expect(response).to have_http_status(302)
    end

    it "fails to update a existing user" do
      params = { name: nil }
      put :update, params: { id: user.id, user: params }
      expect(flash[:notice]).to render_template(:edit)
      expect(response).to have_http_status(422)
    end

  end

  context "DELETE #destroy" do
    let!(:user) {
      create(:user)
    }
    it "successfully deletes a existing user" do
      delete :destroy, params: { id: user.id }
      expect(flash[:notice]).to eq("User was successfully destroyed.")
      expect(response).to redirect_to(action: :index)
      expect(response).to have_http_status(302)
    end

  end
end