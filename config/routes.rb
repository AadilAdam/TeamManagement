Rails.application.routes.draw do
  #resources :players
  resources :teams do
    resources :players
  end

  get 'teams/index'
  # as :user do
  # 	put '/user/confirmation' => 'confirmations#update', 
  # 	:via => :patch, :as => :update_user_confirmation
  # end

  # devise_for :users, controllers: {
  # 	registrations: 'registrations',
  # 	confirmation: 'confirmations'

  # }

  #get "teams/edit" => 'teams#edit', :as => :edit

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "teams#index"

end
