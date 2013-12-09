require 'spec_helper'

describe PagesController do
  context "will render correct views" do
    it "GET #links" do
      get :links
      expect(response).to render_template "links"
    end

    it "GET #archive" do
      get :archive
      expect(response).to render_template "archive"
    end
  end
end
