Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :competitions, only: %w[show]
  resources :participations, only: %w[create show]

  root to: "home#index"
  get   "/:slug" => "competitions#show"
  post  "/:slug/participations" => "participations#create"
  get   "/:slug/participations/:id" => "participations#show"
end
