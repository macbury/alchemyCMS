class Fotografia
  
  attr_accessor :nazwa, :typ, :gallery_dir
  
  def initialize(plik, dir)
    root = "#{RAILS_ROOT}/public/galeria/#{dir}/"
    
    self.nazwa = File.basename(plik)
    self.typ = File.extname(plik).gsub('.','')
    self.gallery_dir = dir
       
    Dir.mkdir "#{root}thumb" unless File.exist?("#{root}thumb")
    
    unless File.exist?(thumb_path(true))
      RAILS_DEFAULT_LOGGER.debug "Miniaturka: #{picture_path}"
      image = MiniMagick::Image.new(picture_path(true))
      RAILS_DEFAULT_LOGGER.debug "    1) Skalowanie "
      image.resize("800x600")
      image = MiniMagick::Image.from_file(picture_path(true))
      RAILS_DEFAULT_LOGGER.debug "    2) Przycinanie "
      image.crop "600x600"
      RAILS_DEFAULT_LOGGER.debug "    3) Generowanie "
      image.resize "75x75"
      RAILS_DEFAULT_LOGGER.debug "    4) Zapisywanie jako #{thumb_path}"
      image.write(thumb_path(true))
      RAILS_DEFAULT_LOGGER.debug "    5) OK!"
    end
  end
  
  def self.find(dir, limit = nil)
    
    root = "#{RAILS_ROOT}/public/galeria/#{dir}/"
    
    surowe_fotografie = Dir.glob("#{root}*.{png,jpg,jpeg,gif,PNG,JPG,JPEG,GIF}")
    
    fotografie = Array.new

    ile = 0 

    for surowka in surowe_fotografie
      fotka = Fotografia.new(surowka,dir)
      fotografie << fotka
      ile += 1
      
      break if !limit.nil? && ile == limit
    end
    
    return fotografie
  end
  
  def self.find_all_galerie
    pliki = Dir.glob("#{RAILS_ROOT}/public/galeria/*")
    
    galerie = Array.new
    pliki.each { |plik| galerie << File.basename(plik) if File.directory?(plik) }
    
    return galerie
  end
  
  def picture_path(root = false)
    dir = String.new
    dir = "#{RAILS_ROOT}/public" if root
    dir += "/galeria/#{gallery_dir}/#{nazwa}"
    
    return dir
  end
  
  def thumb_path(root = false)
    dir = String.new
    dir = "#{RAILS_ROOT}/public" if root
    dir += "/galeria/#{gallery_dir}/thumb/#{nazwa}"
    
    return dir
  end
  
end