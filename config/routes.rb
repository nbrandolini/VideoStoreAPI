Rails.application.routes.draw do

  get 'rentals/check_in'

  get 'rentals/check_out'

  resources :customers, only: [:index]

  resources :movies, only: [:index, :show, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
