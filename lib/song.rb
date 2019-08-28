class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    newsong = Song.new
    newsong.name = name
    newsong
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

def self.new_from_filename(file)
  file = file.chomp(".mp3")
  file = file.split(" - ")
  new_song = self.create_by_name(file[1])
  new_song.artist_name = file[0]
  new_song
end

def self.create_from_filename(file)
  new_song = self.new_from_filename(file)
  @@all << new_song
end

def self.destroy_all
  @@all = []
end
end
