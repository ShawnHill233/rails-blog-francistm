class HomeController < ApplicationController
  def index
    @count = Entry.count
  end
end
