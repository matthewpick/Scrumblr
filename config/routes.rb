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
  match '/users/invite/:project_id', to: 'users#invite', via: :post
  match '/users/:project_id/respond/:answer', to: 'users#respond', via: :post
  match '/projects/:project_id/stories' => 'projects#my_project_stories', via: :get
  match '/tasks/:task_id/moveleft' => 'tasks#move_left', via: :get
  match '/tasks/:task_id/moveright' => 'tasks#move_right', via: :get
  root :to => redirect('/home')
end
