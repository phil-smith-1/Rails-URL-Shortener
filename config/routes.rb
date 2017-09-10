Rails.application.routes.draw do
  get '/' => 'shorteners#new'
  post '/' => 'shorteners#create'
  get '/:path' => 'shorteners#redirect', as: :redirect
end
