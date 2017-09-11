class Shortener
  def self.find(param)
    paths[param]
  end

  def self.paths
    @_paths ||= {}
  end

  def self.new_path_id
    loop do
      path_id = [*('a'..'z'), *('0'..'9')].sample(8).join
      return path_id if paths[path_id].nil?
    end
  end

  def self.format_url(url)
    return '' if url.nil?
    return url.prepend('http://') unless %r{https?://} =~ url
    url
  end
end
