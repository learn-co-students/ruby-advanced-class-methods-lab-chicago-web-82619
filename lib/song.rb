class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new_by_name(song_name)
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    song = self.find_by_name(song_name)
    !!song ? song : self.create_by_name(song_name) 
  end

  def self.alphabetical
    self.all.sort_by! {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_artist, song_name = filename.split('.mp3')[0].split(' - ')
    new_song = self.new_by_name(song_name)
    new_song.artist_name = song_artist
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
