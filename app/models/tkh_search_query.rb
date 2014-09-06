class TkhSearchQuery < ActiveRecord::Base

  has_many :tkh_searches, dependent: :destroy

end
