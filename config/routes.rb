Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    post 'search' => 'search#index'
    get 'index_all_models' => 'search#index_all_models'
  end
end
