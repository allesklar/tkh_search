class TkhSearchInstance < ActiveRecord::Base

  belongs_to :tkh_search_term

  scope :a_bit_old, -> { where('updated_at <= ?', ( Time.now - 2.minutes )) }
  scope :by_top_rating, -> { order('rating desc') }
  scope :for_locale, ->(loc) { where('language = ?', loc) }

  def unique_record_name
    "#{host_model_name}-#{model_record_id}"
  end

end
