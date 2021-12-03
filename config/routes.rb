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
  
  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
  end
end
