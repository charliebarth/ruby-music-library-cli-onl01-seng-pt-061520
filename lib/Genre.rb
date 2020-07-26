class Genre
  extend Concerns::Findable
  attr_accessor :name, :musiclibrarycontroller, :musicimporter
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save
    @@all << self
  end
  
  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.genre != nil
    else
      song.genre = self
      if self.songs.include?(song)
      else
        @songs << song
      end
    end
  end
  
  def artists
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
  end
end