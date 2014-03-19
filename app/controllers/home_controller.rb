class HomeController < ApplicationController
  def feed
    @entries = Entry.order("`created_at` DESC").limit(20)

    respond_to do |format|
      format.html
      format.xml { render content_type: "application/rss+xml" }
    end
  end

  def index
    @count = Entry.count
  end

  def sitemap
    @entry = Entry

    respond_to do |format|
      format.xml { render content_type: "application/xml" }
    end
  end
end
