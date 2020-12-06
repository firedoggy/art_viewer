class ArtViewer::Category
    attr_accessor :name, :ext, :val
    @@all = []
     
    def initialize(name, ext, val)
      @name = name
      @ext = ext
      @val = val
      save
    end 

    def self.all
        ArtViewer::Scraper.scrape_categories if @@all.empty?
            @@all
    end

    def save
        @@all << self
    end

    def self.delete
        @@all.clear
    end
end
   