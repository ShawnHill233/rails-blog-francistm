require 'spec_helper'

describe Admin::SessionsController do
  context "will render correct views" do
    it "GET #new" do
      get :new
      expect(response).to render_template "new"
    end

    it "POST #create failed" do
      user = create(:user, password: "rspec_test_user")
      post :create, :session => { username: user.username }
      expect(response).to redirect_to admin_login_path
    end

    it "POST #create with email succeed" do
      user = create(:user, password: "rspec_test_user")
      post :create, :session => { username: user.email, password: "rspec_test_user" }
      expect(response).to redirect_to admin_path
    end

    it "POST #create with username succeed" do
      user = create(:user, password: "rspec_test_user")
      post :create, :session => { username: user.username, password: "rspec_test_user" }
      expect(response).to redirect_to admin_path
    end

    it "DELETE #destroy" do
      user = create(:user)
      login_user user

      delete :destroy

      expect(response).to redirect_to admin_login_path
    end
  end
end
