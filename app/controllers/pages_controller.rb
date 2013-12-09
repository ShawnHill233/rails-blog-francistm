class PagesController < ApplicationController
  def links
    @links = Link.order "`site_name` ASC"
  end

  def archive
    @entries = Entry.order "`created_at` DESC"
  end
end
