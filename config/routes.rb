Roboterror::Application.routes.draw do

  root to: "homepages#index"

  resources :robots,    :only => ['index', 'show', 'new', 'create', 'edit', 'update', 'destroy']
end
