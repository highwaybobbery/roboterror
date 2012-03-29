Roboterror::Application.routes.draw do

  root to: "high_voltage/pages#show", id: "homepage"

  resource  :user,     :only => ['show', 'create']
  resource  :session,  :only => ['destroy']
  resources :robots,    :only => ['index', 'new']
end
