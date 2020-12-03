class ArtViewer::CLI

    def call
        puts "Welcome to the ASCII Art Gallery"
        @input = ""
        until @input == "exit"
            get_categories
            list_categories
            get_user_category
            #list_subcategories
            #what_next
        end 
        cease
    end

    def get_categories
        case ArtViewer.layer
        when 1
            @categories = ArtViewer::Category.first
        when 2
            @categories = ArtViewer::Category.second
        when 3
            @categories = ArtViewer::Category.third
        end
    end
    
    def list_categories
        puts "Select a category."
        @categories.each.with_index(1) do |category, index|
            puts "#{index}. #{category.name}"
        end
    end

    def get_user_category
        selection = gets.strip.to_i
        list_subcategories(selection) if selection.between?(1, @categories.size)
    end

    def list_subcategories(selection)
        category = @categories[selection - 1]
        ArtViewer.setLayer(ArtViewer.layer + 1)
        ArtViewer::Scraper.scrape_category(category)
    end

    #def what_next

    #end

    def cease

    end
    
end