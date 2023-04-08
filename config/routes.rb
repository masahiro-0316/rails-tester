Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :admins, path: "/-/root" do
    root "top#index"
    devise_for :admins, :controller => {
    }
  end
  devise_for :users
  # Defines the root path route ("/")
  # root "articles#index"
end
