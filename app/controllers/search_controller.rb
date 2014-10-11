class SearchController < ApplicationController

  def index
    @query = params[:query].downcase.strip
    @models_to_search = params[:models_to_search].split
    @results_css_class = params[:results_css_class] || 'js-search-results'
    token = SecureRandom.base64
    search_terms = []
    @query.split.each do |query_word|
      search_terms << TkhSearchTerm.includes(:tkh_search_instances).find_or_create_by( word: query_word )
    end
    search_terms.each do |search_term|
      if search_term.tkh_search_instances.any?
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
    log_search_event
  end

  def index_all_models
    # to disable this, set initializer as an empty array
    TkhSearch::TkhSearchable.indexable_models.each do |model|
      Kernel.const_get(model).reverse_indexing
    end
    redirect_to root_path, notice: "All searchable models have been indexed."
  end

  private

  def log_search_event
    if @query.present?
      search_query = TkhSearchQuery.find_or_create_by( string: @query)
      search_event = TkhSearchEvent.create(
                          tkh_search_query_id: search_query.id,
                          language: I18n.locale )
    end
  end

end
