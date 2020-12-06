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

            #Prevents the program from scraping from the "Sexual" category (nsfw) or the "Band logos" category (empty)
            unless name == "Sexual" || name == "Band logos"           
               ArtViewer::Category.new(name, ref, val)
            end
        end
    end

    def self.scrape_art
        url = "https://www.asciiart.eu#{ArtViewer.extension}"
        coder = HTMLEntities.new

        page = open(url).read

        # Fix all pre tags by forcibly re-encoding their content    
        page = page.gsub(/(<pre.*?>)(.*?)(<\/pre>)/m) {
            pre_start = $1
            content   = coder.encode($2)
            pre_end   = $3
            "#{pre_start}#{content}#{pre_end}"
        }

        doc = Nokogiri::HTML(page)
        art = doc.css(".asciiarts pre")
        art.each do |a|
            ArtViewer::Art.new(a.text)
        end
    end
end