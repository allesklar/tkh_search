class CreateTkhSearchEvents < ActiveRecord::Migration

  def self.up
    create_table :tkh_search_events do |t|
      t.integer :tkh_search_query_id
      t.string  :language
      t.timestamps
    end
    add_index :tkh_search_events, :tkh_search_query_id
  end

  def self.down
    remove_index :tkh_search_events, :tkh_search_query_id
    drop_table :tkh_search_events
  end

end
