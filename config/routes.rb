Scrumbler::Application.routes.draw do
  resources :tasks
  resources :projects
  resources :storys
  resources :sprints


  # resources :users do
  #   resources :story do
  #     resources :task
  #   end
  # end
  #
  # resources :projects do
  #   resources :sprints do
  #     resources :storys do
  #       resources :tasks
  #     end
  #   end
  # end

  root :to => redirect('/projects')
end
