class CreateQueries < ActiveRecord::Migration

  def self.up
    create_table :queries do |t|
      t.string  :string
      t.timestamps
    end
    add_index :queries, :string
  end

  def self.down
    remove_index :queries, :string
    drop_table :queries
  end

end
