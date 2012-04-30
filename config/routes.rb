Roboterror::Application.routes.draw do
  root to: 'homepages#index'

  resource :admin, only: ['show'] do
    resources :users, only: ['index', 'update'], controller: 'admins_users'
    resources :equipments, controller: 'admins_equipments' do
      resources :stats, controller: 'admins_equipments_stats'
    end
  end

  resources :robots
  resources :inventories, only: ['new', 'create']
end
