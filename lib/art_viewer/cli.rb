class ArtViewer::CLI
    attr_accessor :layer, :selection
    @layer = 1
    @selection = ""

    def call
        puts "Welcome to the ASCII Art Gallery"
        @input = ""
        until @input == "exit"
            while ArtViewer.layer <= 2
                get_categories
                list_categories
                get_user_input
            end
            display_art
            continue
        end 
        cease
    end

    def get_categories
        @categories = ArtViewer::Category.all
    end
    
    def list_categories
        if ArtViewer.layer == 1
            puts "Select a category."
        else
            puts "Select a subcategory."
        end

        @categories.each.with_index(1) do |category, index|
            puts "#{index}. #{category.name}"
        end
    end

    def get_user_input
        ArtViewer.setSelection(gets.strip.to_i)
        if @categories[ArtViewer.selection].val == '<'
            ArtViewer.incrementLayer
        end
    end
=begin
    def list_subcategories(selection)
        category = @categories[selection - 1]
        ArtViewer.setLayer(ArtViewer.layer + 1)
        if category.val == '@'
            ArtViewer::Scraper.scrape_category(category)
        elsif category.val == '<'
            ArtViewer::Scraper.scrape_art(category)
        end
    end
=end
    def display_art

    end

    def continue
        puts "Would you like to continue? Type 'exit' to exit or hit any key to restart"
        @input = gets.strip
    end

    def cease

    end
    
end