class EntriesController < ApplicationController
  def show
    @entry = Entry.where(:slug => params[:id]).first
  end
end
