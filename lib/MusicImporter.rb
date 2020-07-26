class MusicImporter
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end 
  
  def files
    Dir.entries(@path).select! {|entry| entry.end_with?(".mp3")}
    #f = Dir[@path + "/*.mp3"]
    #new_array = []
    #f.each do |file|
      #file[@path + "/"] = ""
      #new_array << file
    #end
    #new_array
  end 
  
  def import
    self.files.each{|filename| Song.create_from_filename(filename)}
  end
end