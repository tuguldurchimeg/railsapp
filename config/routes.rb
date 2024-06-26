
Rails.application.routes.draw do
  root "articles#index"

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  # all crud instead of above
  resources :articles do
    resources :comments
  end

  namespace :api do
    namespace :v1 do
      resources :articles
      resources :comments
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
