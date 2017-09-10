class ShortenersController < ApplicationController

  # GET /
  def new
  end

  # POST /
  def create
    path_id = Shortener.new_path_id
    path = request.xhr? ? params['url'] : JSON.parse(params.keys.first)['url']
    Shortener.paths[path_id] = path
    if request.xhr?
      redirect_to new_path, flash: { notice: "New short_url '/#{path_id}' set to '#{path}'" }
    else
      render plain: "{ 'short_url': '/#{path_id}' 'url': '#{path}' }"
    end
  end

  # GET /:url
  def redirect
    unless redirect_path = Shortener.find(params[:url])
      redirect_to new_path, flash: { notice: 'Shortened URL not recognised.' }
    end
    redirect_to redirect_path, status: 301
  end
end
