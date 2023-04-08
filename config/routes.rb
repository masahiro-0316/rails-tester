Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  #root to: "admin/top#index"
  
  namespace :admin, path: "-" do
    root to: "top#index"
    devise_for :admin_users, path: "root", :controller => {
    }
  end
  # Defines the root path route ("/")
  # root "articles#index"
end