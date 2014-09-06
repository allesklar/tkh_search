require "tkh_search/version"
require 'active_record'
require 'sanitize'

require 'tkh_search/tkh_searchable'

module TkhSearch
  class Engine < ::Rails::Engine
  end
end

# reopen ActiveRecord and include all the search methods
ActiveRecord::Base.extend TkhSearch::TkhSearchable
