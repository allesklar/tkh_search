class SearchController < ApplicationController

  def index
    @query = params[:query].downcase
    @models_to_search = params[:models_to_search].split
    @results_css_class = params[:results_css_class] || 'js-search-results'
    token = SecureRandom.base64
    search_terms = []
    @query.split.each do |query_word|
      search_terms << TkhSearchTerm.find_by( word: query_word )
    end
    if search_terms.any?
      search_terms.each do |search_term|
        search_term.tkh_search_instances.each do |search_instance|
          if @models_to_search.include? search_instance.model_name
            search_result = TkhSearchResult.find_or_create_by(
                                token: token,
                                model_name: search_instance.model_name,
                                model_record_id: search_instance.model_record_id)
            search_result.rating += search_instance.rating
            search_result.save
          end
        end
      end
    end
    @search_results = TkhSearchResult.where( token: token ).by_top_rating.limit(25)
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  def index_all_models
    # to disable this, set initializer as an empty array
    TkhSearch::TkhSearchable.indexable_models.each do |model|
      Kernel.const_get(model).reverse_indexing
    end
    redirect_to root_path, notice: "All searchable models have been indexed."
  end

end
