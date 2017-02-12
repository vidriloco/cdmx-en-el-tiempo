Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :pictures
    resources :categories
    resources :articles
    resources :users
    resources :promoted_categories
    resources :seo_for_pages
    root to: "pictures#index"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  
  get '/fotografias/:id(/:name)', to: 'pictures#show', as: 'picture'
  get '/tags/week-top-10', to: redirect('/las-diez-de-la-semana')
  get '/tags/:slug', to: 'tags#show', as: 'tag'
  get '/las-diez-de-la-semana', to: 'popular#index', as: 'weekly_ten'
  get '/coleccion', to: 'pictures#index', as: 'pictures'
  get '/articulos-y-rutas', to: 'articles#index', as: 'articles'
  get '/articulos-y-rutas/:id(/:name)', to: 'articles#show', as: 'article'
end
