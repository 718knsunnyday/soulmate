Rails.application.routes.draw do

  devise_for :publics, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/thanks' => 'customers#thanks', as: :public_thanks
    resources :customers, only: [:show, :edit]
    patch 'customers/update/:id' => 'customers#update', as: :public_update
    get 'customers/unsubscribe/:id' => 'customers#unsubscribe', as: :public_unsubscribe
    patch 'customers/withdraw/:id' => 'customers#withdraw', as: :public_withdraw
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
    patch 'farms/update/:id' => 'farms#update', as: :farm_update
    resources :farms, except: [:update] do
      resource :favorites, only:[:create, :destroy]
    end
  end
end
