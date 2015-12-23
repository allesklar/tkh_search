class SearchStatsController < ApplicationController

  before_action :authenticate
  before_action -> { require_permission 'read_search_stats'}

  def index
    render :layout => 'admin'
  end

end
