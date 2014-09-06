class SearchController < ApplicationController

  def index
    @query = params[:query].downcase
  end

  def index_all_models
    # to disable this, set initializer as an empty array
    TkhSearch::TkhSearchable.indexable_models.each do |model|
      (Kernel.const_get model).reverse_indexing
    end
    redirect_to root_path, notice: "All searchable models have been indexed."
  end

end
