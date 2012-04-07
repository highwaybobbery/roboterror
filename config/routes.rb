Roboterror::Application.routes.draw do

  root to: "high_voltage/pages#show", id: "homepage"

  resources :robots,    :only => ['index', 'new', 'create']
end
