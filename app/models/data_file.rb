class DataFile

  def self.save(upload, dirname)
    spl = upload.original_filename.split('.')
    ext = spl[spl.length-1]
    name =  File.basename(upload.original_filename).gsub(/.#{ext}/,'')<<'.'<<ext
    path = File.join("public/#{dirname}", name)
    File.open(path, "wb") { |f| f.write(upload.read) }
    return name
  end

  def self.delete_all_pdf(dirname)
    files = Dir.glob("public/#{dirname}/*.pdf")
    files.each{|f| File.delete(f)}
  end

  def self.get_first_pdf(dirname)
    Dir.glob("public/#{dirname}/*.pdf").first
  end

end