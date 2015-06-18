MusicApp::Application.routes.draw do
  resources :users, only: [:create, :new, :show]

  resource :session, only: [:create, :new, :destroy]

  resources :bands

  resources :albums, only: [:new, :create, :edit, :show,
    :update, :destroy]

  resources :tracks, only: [:new, :create, :edit, :show,
    :update, :destroy]

  resources :notes, only: [:new, :create, :edit, :show,
    :update, :destroy]

  root to: "sessions#new"

end
