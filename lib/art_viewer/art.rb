class ArtViewer::Art
    attr_accessor :body
    @@all = []

    def initialize(body)
        #@ref = ref
        @body = body
        save
    end

    def self.all
        ArtViewer::Scraper.scrape_art if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end

    def self.delete
        @@all.clear
    end
end