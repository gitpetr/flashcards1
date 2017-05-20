Rails.application.routes.draw do
  resources :cards #, only: [:index, :show]
  patch '/check_translation/:id', to: 'home#update', as: "/check_translation"
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
