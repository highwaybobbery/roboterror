Roboterror::Application.routes.draw do
  root to: 'homepages#index'

  resource :admin, only: ['show'] do
    resources :users, only: ['index', 'update'], controller: 'admins_users'
    resources :equipments, controller: 'admins_equipments' do
      resources :stats, only: ['create', 'update', 'destroy'], controller: 'admins_equipments_stats'
    end
  end

  resources :robots do
    resources :inventories, controller: 'robot_inventories'
    resources :fights, only:  ['new', 'create']
    resources :fight_results, only:['show']
  end

  resources :inventories, only: ['new', 'create']
end
