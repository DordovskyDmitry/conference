class DataFile
  #require 'rutils'

  def self.save(upload)
    File.open("#{RAILS_ROOT}/public/asd.pdf", "w+") { |f| f.write(upload.read); f.close }
    return 1
    #spl = upload.original_filename.split('.')
    #ext = spl[spl.length-1]
    #name = File.basename(upload.original_filename).gsub(/.#{ext}/, '').dirify<<'.'<<ext
    #directory = "public"
    #path = File.join(directory, name)
    #File.open(path, "wb") { |f| f.write(upload.read) }
    #return name
  end

end