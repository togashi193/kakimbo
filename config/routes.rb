Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :billings, only: %i[index create]

  resources :games, only: [:index]
end
