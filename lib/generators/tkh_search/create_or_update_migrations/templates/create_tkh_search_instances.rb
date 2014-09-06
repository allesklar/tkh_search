class CreateTkhSearchInstances < ActiveRecord::Migration

  def self.up
    create_table :tkh_search_instances do |t|
      t.integer :tkh_search_term_id
      t.string  :model_name
      t.integer :model_record_id
      t.integer :rating
      t.string  :language
      t.boolean :published, default: false
      t.timestamps
    end
    add_index :tkh_search_instances, :tkh_search_term_id
  end

  def self.down
    remove_index :tkh_search_instances, :tkh_search_term_id
    drop_table :tkh_search_instances
  end

end
