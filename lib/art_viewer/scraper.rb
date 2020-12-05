class ArtViewer::Scraper

    def self.scrape_categories
        url = "https://www.asciiart.eu#{ArtViewer.extension}"
        doc = Nokogiri::HTML(open(url))

        categories = doc.css(".directory-columns a")

        categories.each do |c|
            name = c.to_s.match(/(?<=>)(.*?)[@<]/)
            name = name.to_s.sub("&amp;", "and")
            ref = c.attr("href")
            val = name.to_s.slice(-1,1)
            name = name.to_s.chop
            unless name == "Sexual"             #Prevents the program from scraping from the "Sexual" category
               ArtViewer::Category.new(name, ref, val)
            end
        end
    end

    def self.scrape_art
        url = "https://www.asciiart.eu#{ArtViewer.extension}"
        doc = Nokogiri::HTML(open(url))

        art = doc.css(".asciiarts pre")

        art.each do |a|
            ArtViewer::Art.new(a.text)
        end
    end
end