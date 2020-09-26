Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :patients, only: [:index, :show]

  resources :customers, only: [:index, :show]

  resources :partners, only: [:index, :show]
end


# resources :guests, only: [:index, :show]
# resources :episodes, only: [:index, :show]
# resources :appearances, only: [:index, :show, :new, :create]