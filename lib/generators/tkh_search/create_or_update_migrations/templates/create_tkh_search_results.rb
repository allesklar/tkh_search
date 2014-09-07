class CreateTkhSearchResults < ActiveRecord::Migration

  def self.up
    create_table :tkh_search_results do |t|
      t.string  :token
      t.string  :model_name
      t.integer :model_record_id
      t.integer :rating,            default: 0
      t.timestamps
    end
    add_index :tkh_search_results, :token
  end

  def self.down
    remove_index :tkh_search_results, :token
    drop_table :tkh_search_results
  end

end
