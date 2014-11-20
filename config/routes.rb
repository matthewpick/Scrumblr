Scrumbler::Application.routes.draw do
  # resources :tasks
  # resources :projects
  # resources :storys

  resources :projects do
    resources :sprints
  end

  resources :sprints do
    resources :storys
  end

  resources :storys do
    resources :tasks
  end

  resources :users, :only => :show
  match 'auth/:provider/callback' => 'session#create'
  match '/signout' => 'session#destroy', :as => :signout

  root :to => redirect('/projects')
end
