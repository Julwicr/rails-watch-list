Rails.application.routes.draw do
  root "lists#index"
  resources :lists, only: %i[show new create] do
    resources :bookmarks, only: %i[new create destroy]
  end
end
