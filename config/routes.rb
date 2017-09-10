Rails.application.routes.draw do
  get '/' => 'shorteners#new'
  post '/' => 'shorteners#create'
  get '/:url' => 'shorteners#redirect', as: :redirect
end
