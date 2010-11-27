class DataFile

  DIRNAME = "public/pdf"

  def self.save(upload)
    spl = upload.original_filename.split('.')
    ext = spl[spl.length-1]
    name =  File.basename(upload.original_filename).gsub(/.#{ext}/,'')<<'.'<<ext
    path = File.join(DIRNAME, name)
    File.open(path, "wb") { |f| f.write(upload.read) }
    return name
  end

  def self.delete_all_pdf
    files = Dir.glob("public/pdf/*.pdf")
    files.each{|f| File.delete(f)}
  end

  def self.get_first_pdf
    Dir.glob("#{DIRNAME}/*.pdf").first
  end

end