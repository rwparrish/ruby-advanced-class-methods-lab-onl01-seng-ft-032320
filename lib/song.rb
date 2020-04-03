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
#instatiates song, saves song, then returns song
    song = self.new
    song.save
    song
  end
  
  def self.new_by_name(name)
#instatiates song, give it a name property, return name
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
#instatiates name, saves to @@all[]
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
#iterate through @@all and look for name
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if 
     song.class.find_by_name(name)
     song
    else
     song.class.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(data)
    data.delete_suffix!(".mp3")
    arr = data.split(" - ")
    song = self.new
    song.artist_name = arr[1]
    song.name = arr[0]
    song
  end
  
  def self.create_from_filename(data)
    song = self.new_from_filename(data)
    song.save
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
  
end
