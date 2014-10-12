class TkhSearchEvent < ActiveRecord::Base

  belongs_to :tkh_search_query

  scope :last_24_hours, -> { where("created_at >= ?", Time.zone.now - 24.hours ) }
  scope :last_month, -> { where("created_at >= ?", Time.zone.now - 1.month ) }

end
