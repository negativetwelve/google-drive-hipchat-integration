GoogleDriveHipchat::Application.routes.draw do
  root to: 'pages#home'

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
end
