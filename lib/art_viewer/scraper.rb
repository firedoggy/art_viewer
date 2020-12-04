class ArtViewer::Scraper
    #@extension = "/"

    def self.scrape_categories
       
 #       case ArtViewer::CLI.layer
 #       when 1
 #           @extension = ArtViewer::Category.all[sel].href
 #       when 2
 #           @extension = ArtViewer::Category.all[sel].href
 #       when 3
 #           @extension = ArtViewer::Category.all[sel].href
 #       end
        

        url = "https://www.asciiart.eu#{ArtViewer.extension}"
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
=begin
    def self.scrape_category(category)
        url = "https://www.asciiart.eu#{category.ref}"
        self.scrape_categories(url)
    end
=end
    def self.scrape_art(category)
        url = "https://www.asciiart.eu#{category.ref}"
        doc = Nokogiri::HTML(open(url))

        categories = doc.css(".asciiarts pre")

        categories.each do |c|
            art = c.text
            ArtViewer::Art.new(category, body)
        end
    end
end