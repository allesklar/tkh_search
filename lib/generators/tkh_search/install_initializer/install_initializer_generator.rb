require 'rails/generaTors/migration'

module TkhSearch
  module Generators
    class InstallInitializerGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "install initializer"
      def set_up_search_initializer
        copy_file "tkh_search.rb", "config/initializers/tkh_search.rb"
      end

    end
  end
end
