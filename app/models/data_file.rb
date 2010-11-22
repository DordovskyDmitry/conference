class DataFile

  def self.save(upload)
    spl = upload.original_filename.split('.')
    ext = spl[spl.length-1]
    name =  File.basename(upload.original_filename).gsub(/.#{ext}/,'')<<'.'<<ext
    directory = "public"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload.read) }
    return name
  end

end