Rails.application.routes.draw do
  # These routes are compatible with the route_translator gem
  # without the localized block, the controller would not return the proper current locale
  localized do
    post 'search' => 'search#index'
    get 'index_all_models' => 'search#index_all_models'
    get 'search_stats' => 'search_stats#index'
  end
end
