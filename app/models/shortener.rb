class Shortener
  def self.find(param)
    paths[param]
  end

  def self.paths
    @_paths ||= {}
  end

  def self.new_path_id
    loop do
      path_id = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
      return path_id if paths[path_id].nil?
    end
  end

  def self.format_url(url)
    return '' if url.nil?
    return url.prepend('http://') unless /https?:\/\//.match(url)
    url
  end
end
