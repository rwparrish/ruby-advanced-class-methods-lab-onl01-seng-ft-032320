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
  @name = self.new
  @name.save
  @name
end
def self.new_by_name(name)
#instatiates song, give it a name property, return name
  @name = self.new
  @name.name = name
  @name
end
def self.create_by_name(name)
#instatiates name, saves to @@all[]
  @name = self.new
  @name.name = name
  @name.save
  @name
end
def self.find_by_name(name)
#iterate through @@all and look for name
  @@all.find{|song| song.name == name}
end
def self.find_or_create_by_name(name)
  if 
    @name.class.find_by_name(name)
    @name
  else
    @name.class.create_by_name(name)
  end
end
def self.alphabetical
  self.all.sort_by {|i| i.name}
end
def self.new_from_filename(data)
  data.delete_suffix!(".mp3")
  new_array = data.split(" - ")
  song = self.new
  song.name = new_array[1]
  song.artist_name = new_array[0]
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
