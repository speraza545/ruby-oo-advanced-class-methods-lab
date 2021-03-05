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
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }

    # @@all.include?(name) ? @@all[@@all.find_index(name)] : false
    # instance = ""
    # @@all.each do |song|
    #   if song.name == name 
    #     instance = song
    #     break
    #   else
    #     instance = false
    #   end
    # end
    # instance
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file)
    file_split = file.split(" - ")
    artist = file_split[0]
    song_title = file_split[1].gsub(".mp3", "")

    song = self.create
    song.name = song_title
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    file_split = file.split(" - ")
    artist = file_split[0]
    song_title = file_split[1].gsub(".mp3", "")

    song = self.create
    song.name = song_title
    song.artist_name = artist
    song
  end

  def self.destroy_all
    self.all.clear
  end


end
