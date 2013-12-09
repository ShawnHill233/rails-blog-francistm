class HomeController < ApplicationController
  def feed
    @entries = Entry.order("`created_at` DESC").limit(20)

    respond_to do |format|
      format.html
      format.xml do
        render :layout => false,
               :content_type => "application/rss+xml"
      end
    end
  end

  def index
    @count = Entry.count
  end
end
