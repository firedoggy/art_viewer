class ArtViewer::Scraper
    def self.scrape_categories(url = "https://www.asciiart.eu/")
        doc = Nokogiri::HTML(open(url))

        categories = doc.css(".directory-columns a")

        categories.each do |c|
            name = c.to_s.match(/(?<=>)(.*?)[@<]/)
            name = name.to_s.sub("&amp;", "and")
            ref = c.attr("href")
            val = name.to_s.slice(-1,1)
            name = name.to_s.chop
            ArtViewer::Category.new(name, ref, val)
        end
    end

    def self.scrape_category(category)
        url = "https://www.asciiart.eu#{category.ref}"
        self.scrape_categories(url)
    end

    def self.scrape_subject

    end
end