RubyWedding::Engine.routes.draw do

  get     'login',  to: 'session#new'
  post    'login',  to: 'session#create'
  delete  'logout', to: 'session#destroy'

  namespace :protected do
    get '/', to: 'base#index', as: 'root'
    resources :guests, only: [:index]
  end

  resources :invitations, only: [:edit, :update] do
    collection { get :find }
    member { get :thanks }
  end

end
