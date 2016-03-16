Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'photos' => 'photos#index', as: :photos
  get 'photos/:id' => 'photos#show', as: :photo
  post 'photos' => 'photos#create'
  patch 'photos/:id' => 'photos#update'
  delete 'photos/:id' => 'photos#delete'

  # namespace :api do
    # resources :photos, except: [:new, :edit]
  # end
end
