class SearchController < ApplicationController

  def index
    @query = params[:query].downcase
    @models_to_index = params[:models_to_index].split
    search_terms = []
    @query.split.each do |query_word|
      search_terms << TkhSearchTerm.find_by( word: query_word )
    end
    instance_ids = []
    if search_terms.any?
      search_terms.each do |search_term|
        search_term.tkh_search_instances.each do |search_instance|
          instance_ids << search_instance.id if @models_to_index.include? search_instance.model_name
        end
      end
    end
    if instance_ids.any?
      @results = TkhSearchInstance.where(id: instance_ids).by_top_rating.limit(25)
    else
      @results = []
    end
  end

  def index_all_models
    # to disable this, set initializer as an empty array
    TkhSearch::TkhSearchable.indexable_models.each do |model|
      (Kernel.const_get model).reverse_indexing
    end
    redirect_to root_path, notice: "All searchable models have been indexed."
  end

end
