#encoding: utf-8
require 'spec_helper'

describe HomeController do
  context "will render correct views" do
    it "GET #feed as xml" do
      get :feed, :format => :xml
      expect(response).to render_template "feed"
      expect(response.content_type).to eq "application/rss+xml"
    end

    it "GET #feed as html" do
      get :feed, :format => :html
      expect(response).to render_template "feed"
      expect(response.content_type).to eq "text/html"
    end

    it "GET #index" do
      get :index
      expect(response).to render_template "index"
    end
  end
end
