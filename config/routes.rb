GoogleDriveHipchat::Application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :hipchat_rooms, only: [:new, :create, :show]
  resources :g_drive_resources, only: [:new, :create, :show]
  match "resources/watch", to: "g_drive_resources#watch", as: :watch_g_drive_resource, via: :post
  match "resources/notification", to: "g_drive_resources#notification", as: :g_drive_resource_notification, via: :post
end
