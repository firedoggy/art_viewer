class ArtViewer::Category
    attr_accessor :name, :ref, :val
    @@all = []
     
    def initialize(name, ref, val)
      @name = name
      @ref = ref
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
   