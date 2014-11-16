Scrumbler::Application.routes.draw do
  # resources :tasks
  # resources :projects
  # resources :storys


  resources :users do
    resources :projects do
      resources :sprints do
        resources :storys do
          resources :tasks
        end
      end
    end
  end

  root :to => redirect('/projects')
end
