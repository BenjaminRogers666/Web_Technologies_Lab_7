Rails.application.routes.draw do
  # Rutas RESTful estándar para los recursos
  resources :users, only: [:index, :show]
  resources :chats, only: [:index, :show]
  resources :messages, only: [:index, :show]

  # Ruta para verificación de salud
  get "up" => "rails/health#show", as: :rails_health_check

  # Ruta raíz
  root 'users#index'
end