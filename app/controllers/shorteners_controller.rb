class ShortenersController < ApplicationController
  # GET /
  def new; end

  # POST /
  def create
    path_id = Shortener.new_path_id
    path = path_from_param
    Shortener.paths[path_id] = Shortener.format_url(path)
    create_render_or_redirect(path, path_id)
  end

  # GET /:url
  def redirect
    unless Shortener.find(params[:url])
      redirect_to new_path, flash: { notice: 'Shortened URL not recognised.' }
    end
    redirect_to Shortener.find(params[:url]), status: 301
  end

  private

  def path_from_param
    request.xhr? ? params['url'] : JSON.parse(params.keys.first)['url']
  end

  def create_render_or_redirect(path, path_id)
    if request.xhr?
      redirect_to new_path, flash: { notice: "New short_url <a href='/#{path_id}' target='_blank'>'/#{path_id}'</a> set to '#{path}'" }
    else
      render plain: "{ 'short_url': '/#{path_id}' 'url': '#{path}' }"
    end
  end
end
