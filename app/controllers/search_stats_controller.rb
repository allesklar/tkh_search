class SearchStatsController < ApplicationController

  before_filter :authenticate
  before_filter :authenticate_with_admin

  def index
    switch_to_admin_layout
  end

end
