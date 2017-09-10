Rails.application.routes.draw do
  get '/' => 'shorteners#new', as: :new
  post '/' => 'shorteners#create', as: :create
  get '/:url' => 'shorteners#redirect', as: :redirect
end
