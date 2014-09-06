class CreateTkhSearchQueries < ActiveRecord::Migration

  def self.up
    create_table :tkh_search_queries do |t|
      t.string  :string
      t.timestamps
    end
    add_index :tkh_search_queries, :string
  end

  def self.down
    remove_index :tkh_search_queries, :string
    drop_table :tkh_search_queries
  end

end
