# require 'pry'

class Artist 
    attr_accessor :name 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def add_song(song)
        song.artist = self 
    end 

    def songs
        Song.all.select {|song| song.artist == self}
    end 

    def self.find_or_create_by_name(artist_name)
        artist = self.all.find {|artist| artist.name == artist_name}
        artist = Artist.new(artist_name) if artist == nil
        artist 
    end 

    def print_songs
        songs = self.songs.collect {|song| song.name}
        puts songs
    end
end 

# drake = Artist.new('Drake')
# print "Artist All: #{Artist.all} \n"
# o1 = Artist.find_or_create_by_name('Drake')
# o2 = Artist.find_or_create_by_name('Peach Pit')
# print "o1: #{o1}\n" 
# print "o2: #{o2}"