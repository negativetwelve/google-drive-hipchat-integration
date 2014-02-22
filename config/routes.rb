GoogleDriveHipchat::Application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :hipchat_rooms, only: [:new, :create]
  resources :g_drive_resources, only: [:new, :create]
end
