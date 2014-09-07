class TkhSearchQuery < ActiveRecord::Base

  has_many :tkh_search_events, dependent: :destroy

end
