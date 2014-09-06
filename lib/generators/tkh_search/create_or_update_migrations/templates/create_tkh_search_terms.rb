class CreateTkhSearchTerms < ActiveRecord::Migration

  def self.up
    create_table :tkh_search_terms do |t|
      t.string :word
      t.timestamps
    end
    add_index :tkh_search_terms, :word
  end

  def self.down
    remove_index :tkh_search_terms, :word
    drop_table :tkh_search_terms
  end

end
