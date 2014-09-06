class TkhSearchTerm < ActiveRecord::Base

  has_many :tkh_search_instances, dependent: :destroy

end
