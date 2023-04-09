Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

namespace :admin do
  root to: "top#index"
  end
end
