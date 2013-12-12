require 'spec_helper'

describe Admin::EntriesController do

  before :each do
    @user = create(:user)
    login_user @user
  end

  context "will render correct pages" do
    it "GET #new" do
      get :new
      expect(response).to render_template "new"
    end

    it "GET #edit" do
      entry = create(:entry)
      get :edit, :id => entry
      expect(response).to render_template "edit"
    end

    it "GET #index" do
      get :index
      expect(response).to render_template "index"
    end

    it "PUT #update" do
      entry = create(:entry)
      put :update, :id => entry, :entry => { :content => "something_new" }

      expect(assigns(:entry).content).eq "something_new"
      expect(response).to redirect_to admin_entries_path
    end

    it "POST #create" do
      post :create, :entry => attributes_for(:entry)

      expect(response).to redirect_to admin_entries_path
    end

    it "DELETE #destroy" do
      entry = create(:entry)
      delete :destroy, id: entry

      expect(entry.persisted?).to be_false
      expect(response).to redirect_to admin_entries_path
    end
  end
end
