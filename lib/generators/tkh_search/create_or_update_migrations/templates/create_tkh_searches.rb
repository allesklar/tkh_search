class CreateTkhSearches < ActiveRecord::Migration

  def self.up
    create_table :tkh_searches do |t|
      t.integer :tkh_search_query_id
      t.string  :language
      t.timestamps
    end
    add_index :tkh_searches, :tkh_search_query_id
  end

  def self.down
    remove_index :tkh_searches, :tkh_search_query_id
    drop_table :tkh_searches
  end

end
