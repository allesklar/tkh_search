require 'rails/generaTors/migration'

module TkhSearch
  module Generators
    class CreateOrUpdateMigrationsGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('../templates', __FILE__)
      desc "add the migrations and locale files"
      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def copy_migrations
        puts 'creating search migrations'
        migration_template "create_tkh_search_terms.rb", "db/migrate/create_tkh_search_terms.rb"
        migration_template "create_tkh_search_instances.rb", "db/migrate/create_tkh_search_instances.rb"
        migration_template "create_tkh_search_queries.rb", "db/migrate/create_tkh_search_queries.rb"
        migration_template "create_tkh_search_events.rb", "db/migrate/create_tkh_search_events.rb"
        migration_template "create_tkh_search_results.rb", "db/migrate/create_tkh_search_results.rb"
      end

    end
  end
end
