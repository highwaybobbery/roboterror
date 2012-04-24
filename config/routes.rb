Roboterror::Application.routes.draw do
  root to: 'homepages#index'

  resource :admin, only: ['show'] do
    resources :users, only: ['index', 'update'], controller: 'admins_users'
    resources :equipments, only: ['index', 'new', 'create'],
      controller: 'admins_equipments'
  end

  resources :robots
  resources :inventories, :only => ['new', 'create']
end
