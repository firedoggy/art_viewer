class ArtViewer::Scraper
    def self.scrape_categories
        doc = Nokogiri::HTML(open("https://www.asciiart.eu/"))

        categories = doc.css(".directory-columns a")

        categories.each do |c|
            name = c.name
            ref = c.attr("href")
            ArtViewer::Category.new(name, ref)
        end
    end

    def self.scrape_category(category)
        url = "https://www.asciiart.eu#{category.ref}"
        doc = Nokogiri::HTML(open(url))
    end

    def self.scrape_art

    end
end