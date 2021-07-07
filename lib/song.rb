class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
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
  file = file.delete_suffix(".mp3")
  file = file.split(" - ")
  new_song = self.create_by_name(file[1])
  new_song.artist_name = file[0]
  new_song
end

def self.create_from_filename(file)
  song = self.new_from_filename(file)
  @@all << song
end

def self.destroy_all
  @@all = []
end
end
