Scrumbler::Application.routes.draw do
  # resources :tasks
  # resources :projects
  # resources :storys


  resources :users

  resources :projects do
    resources :sprints
  end

  resources :sprints do
    resources :storys
  end

  resources :storys do
    resources :tasks
  end

  root :to => redirect('/projects')
end
