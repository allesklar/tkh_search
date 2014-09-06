class TkhSearchInstance < ActiveRecord::Base

  belongs_to :tkh_search_term

  scope :a_bit_old, -> { where('updated_at <= ?', ( Time.now - 5.minutes )) }
  scope :by_top_rating, -> { order('rating desc') }

end
