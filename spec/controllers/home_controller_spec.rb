#encoding: utf-8
require 'spec_helper'

describe HomeController do
  context "will render correct views" do
    it "GET #index" do
      get :index
      expect(response).to render_template "index"
    end
  end
end
