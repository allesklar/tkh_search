class FixDangerousAttributes < ActiveRecord::Migration

  # ActiveRecord raises an exception if some model attributes
  # use the same word as some AR methods or attributes.

  def self.up
    rename_column :tkh_search_instances, :model_name, :host_model_name
    rename_column :tkh_search_results, :model_name, :host_model_name
  end

  def self.down
    rename_column :tkh_search_instances, :host_model_name, :model_name
    rename_column :tkh_search_results, :host_model_name, :model_name
  end

end
