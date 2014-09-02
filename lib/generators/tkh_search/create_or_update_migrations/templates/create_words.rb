class CreateWords < ActiveRecord::Migration

  def self.up
    create_table :words do |t|
      t.string :term
      t.timestamps
    end
    add_index :words, :term
  end

  def self.down
    remove_index :words, :term
    drop_table :words
  end

end
