class TkhSearchResult < ActiveRecord::Base

  scope :by_top_rating, -> { order('rating desc') }

end
