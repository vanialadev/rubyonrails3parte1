Rails.application.routes.draw do

  resources :jobs do
    post "comments" => "comments#create"
  end
  delete "comments/:id" => "comments#destroy", as: :comment
  get 'hello/world'
  root "jobs#premium"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
