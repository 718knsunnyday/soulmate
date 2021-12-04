Rails.application.routes.draw do
  devise_for :publics, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
    passwords: "public/passwords"
  }
  devise_for :farmers, controllers: {
    registrations: "farmer/registrations",
    sessions: "farmer/sessions",
    passwords: "farmer/passwords"
  }
  
  namescape :farmer do
    resources :customers, only: [:show, :edit, :update, :destroy]
  
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
  end
end
