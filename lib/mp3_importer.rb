class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path 
    end 
    
    #Dir.children('path') will give an array of all files in that path
    def files 
        Dir.children(self.path).select{|file| file =~ /mp3/}
    end 

    def import
        self.files.each {|filename| Song.new_by_filename(filename)}
    end 
end 


# test_music_path = "./spec/fixtures/mp3s"
# music_importer = MP3Importer.new(test_music_path)
# print music_importer.files