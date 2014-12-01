Scrumbler::Application.routes.draw do
  # resources :tasks
  # resources :projects
  # resources :storys

  resources :projects do
    resources :sprints do
      get 'scrumboard'
    end
  end

  resources :sprints do
    resources :storys
  end

  resources :storys do
    resources :tasks
  end

  resources :home, :only => :index
  resources :users, :only => :show
  match 'auth/:provider/callback' => 'session#create'
  match '/signout' => 'session#destroy', :as => :signout
  match '/users/invite', to: 'users#invite', via: :post

  root :to => redirect('/home')
end
