require 'pry'
class Song 
    attr_accessor :name, :artist 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def self.new_by_filename(filename)
        parsed = filename.split(' - ')
        #parsed[0] is artist, parsed[1] is song_name, parsed[3] is genre.mp3
        song = Song.new(parsed[1])
        song.artist_name = parsed[0]
        song
    end
    
    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        self.artist = artist
    end 
end 
