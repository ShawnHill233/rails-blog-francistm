class EntriesController < ApplicationController
  def show
    @entry = Entry.find_by_slug params[:id]
  end
end
