Rails.application.routes.draw do
  devise_for :publics, controllers: {
    registrations: "publics/registrations",
    sessions: "publics/sessions",
    passwords: "publics/passwords"
  }
  devise_for :farmers, controllers: {
    registrations: "farmers/registrations",
    sessions: "farmers/sessions",
    passwords: "farmers/passwords"
  }
  
end
