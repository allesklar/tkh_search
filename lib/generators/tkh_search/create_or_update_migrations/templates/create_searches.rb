class CreateSearches < ActiveRecord::Migration

  def self.up
    create_table :searches do |t|
      t.integer :query_id
      t.string  :language
      t.timestamps
    end
    add_index :searches, :query_id
  end

  def self.down
    remove_index :searches, :query_id
    drop_table :searches
  end

end
