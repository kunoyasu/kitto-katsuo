
  root "tickets#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
   resources :users, only: [:edit, :update,:destroy]
   resources :tickets

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
