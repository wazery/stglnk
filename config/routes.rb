Stglnk::Application.routes.draw do
  root 'pages#home'

  get '/home', to: 'pages#home', as: 'home'
  post '/query', to: 'pages#query', as: 'query'
end
