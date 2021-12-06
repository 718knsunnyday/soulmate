Rails.application.routes.draw do

  devise_for :publics, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resource :customers, only: [:show, :edit, :update]
  end

  devise_for :farmers, controllers: {
    registrations: "farmer/registrations",
    sessions: "farmer/sessions",
    passwords: "farmer/passwords"
  }

  namespace :farmer do
    get 'customers/thanks' => 'customers#thanks'
    resources :customers, only: [:show, :edit, :update]
    get 'customers/unsubscribe/:id' => 'customers#unsubscribe'
    patch 'customers/withdraw/:id' => 'customers#withdraw', as: :withdraw
    resources :farms
  end
end
