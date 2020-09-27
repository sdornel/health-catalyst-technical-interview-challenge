Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :patients, only: [:index, :show]

  resources :customers, only: [:index, :show, :update]  

  resources :partners, only: [:index, :show, :update]

  get 'customers/:id/edit', to: 'customers#edit', as: :edit_customer

  get 'partners/:id/edit', to: 'partners#edit', as: :edit_partner

  resources :exports, only: [:index, :show]

end


# resources :guests, only: [:index, :show]
# resources :episodes, only: [:index, :show]
# resources :appearances, only: [:index, :show, :new, :create]

# Rails.application.routes.draw do
#   root to: 'shelters#index'
#   resources :users
#   get '/adoptions', to: 'adoptions#index'
#   post '/adoptions_approve/:id', to: 'adoptions#approve'
#   delete '/adoption_destroy/:id', to: 'adoptions#destroy'
#   resources :animals do
#     resources :adoptions
#   end
#   # resources :shelters, only: [:index]#, :analytics]
#   get '/shelters/analytics', to: 'shelters#analytics'

#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end
