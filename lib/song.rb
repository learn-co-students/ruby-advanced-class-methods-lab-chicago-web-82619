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
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    return song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    result = self.find_by_name(name)
    if (!result)
      result = self.create_by_name(name)
    end

    return result

  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    artist, name, ext = file_name.split(/[.-]/)
    name.delete_prefix!(" ")
    artist.delete_suffix!(" ")
    song = self.new_by_name(name)
    song.artist_name = artist
    return song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    @@all << song
    return song
  end

  def self.destroy_all
    @@all.clear
  end


end
