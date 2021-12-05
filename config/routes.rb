Rails.application.routes.draw do
  
  devise_for :publics, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }
  
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resource :customers, only: [:show, :edit, :update, :destroy]
  end
  
  devise_for :farmers, controllers: {
    registrations: "farmer/registrations",
    sessions: "farmer/sessions",
    passwords: "farmer/passwords"
  }

  namespace :farmer do
    resource :customers, only: [:show, :edit, :update, :destroy]
  end
end
