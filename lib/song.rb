require "pry"
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
    p = self.new
    p.save
    p
  end

  def self.new_by_name(name)
    self.create_by_name(name)
  end

  def self.create_by_name(name)
    p = self.new
    p.name = name
    p.save
    p
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      p = find_by_name(name)
    else
      p = create_by_name(name)
    end
    p
  end

  def self.alphabetical
    arr = self.all.sort_by do |object|
      object.name
    end
    arr
  end
  def self.new_from_filename(filename)
    p = create_from_filename(filename)
    p
  end
  def self.create_from_filename(filename)
    p = arr = filename.split(/[-.]/).map(&:strip)
    p = create_by_name(arr[1])
    p.artist_name = arr[0]
    p
  end
  def self.destroy_all
    Song.all.clear
  end
end
