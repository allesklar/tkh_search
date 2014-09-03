class SearchController < ApplicationController

  def index
    @query = params[:query].downcase
  end

end
