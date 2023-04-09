Rails.application.routes.draw do
 # namespace :admin do
 #   get 'top/index'
 # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

namespace :admin do
  root to: "top#index"
  devise_for :admin_users, controllers: {
    registrations: 'admin/registrations',
    sessions: 'admin/sessions'
  }
#  devise_scope :admin_users do
#    get 'sigin_in' to: 'dmin#index'
#  end
  end
end
