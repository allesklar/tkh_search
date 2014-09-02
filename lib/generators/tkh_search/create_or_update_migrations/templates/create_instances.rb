class CreateInstances < ActiveRecord::Migration

  def self.up
    create_table :instances do |t|
      t.integer :word_id
      t.string  :model_name
      t.integer :model_record_id
      t.integer :rating
      t.string  :language
      t.timestamps
    end
    add_index :instances, :word_id
  end

  def self.down
    remove_index :instances, :word_id
    drop_table :instances
  end

end
