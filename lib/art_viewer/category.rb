class ArtViewer::Category
    attr_accessor :name, :ref, :val
    @@first = []
    @@second = []
    @@third = []
     
    def initialize(name, ref, val)
      @name = name
      @ref = ref
      @val = val
      save
    end 

    def self.first
        ArtViewer::Scraper.scrape_categories if @@first.empty?
        @@first
    end

    def self.second
        ArtViewer::Scraper.scrape_categories if @@second.empty?
        @@second
    end

    def self.third
        ArtViewer::Scraper.scrape_categories if @@third.empty?
        @@third
    end

    def save
        case ArtViewer.layer
        when 1 
            @@first << self
        when 2
            @@second << self
        when 3
            @@third << self
        end
    end
end
   