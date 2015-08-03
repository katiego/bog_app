Rails.application.routes.draw do

  get 'creatures/new'

  get 'creatures/edit'

root to: 'creatures#index'
resources :creatures, only: [:index, :new, :create, :edit, :update, :patch, :destroy]

end
