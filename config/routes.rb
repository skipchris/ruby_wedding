RubyWedding::Engine.routes.draw do

  get     'login',  to: 'session#new'
  post    'login',  to: 'session#create'
  delete  'logout', to: 'session#destroy'

  namespace :protected do
    get '/', to: 'base#index', as: 'root'
  end

  resources :invitations, only: [:show] do
    collection { get :find }
  end

end
