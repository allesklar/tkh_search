class SearchStatsController < ApplicationController

  before_filter :authenticate
  before_filter :authenticate_with_admin

  def index
    render :layout => 'admin'
  end

end
