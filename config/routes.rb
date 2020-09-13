Rails.application.routes.draw do
root "tickets#index"
  devise_for :users, controllers: { registrations: 'users/registrations' }
   resources :users, only: [:show ,:edit, :update,:destroy]
   resources :tickets
   resources :messages, only: [:create]
   resources :rooms, only: [:create,:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
