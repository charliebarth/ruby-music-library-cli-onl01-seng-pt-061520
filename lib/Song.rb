class Song
  attr_accessor :name, :artist, :genre, :musiclibrarycontroller, :musicimporter
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
   if genre != nil
      self.genre=(genre)
    end
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
    song = self.new(name)
    song.save
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def self.find_by_name(song_name)
    @@all.detect do |song|
      song.name == song_name
    end
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create(song_name)
    end
  end
  
  def self.new_from_filename(filename)
    
    song_array = filename.split(" - ")
    song_name = song_array[1]
    artist_name = song_array[0]
    genre_name = song_array[2].split(".mp3").join
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
    
end