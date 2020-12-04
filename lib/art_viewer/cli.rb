class ArtViewer::CLI
    attr_accessor  :selection, :categories, :art
    @selection = ""
    @categories = []
    @art = []


    def call
        puts "Welcome to the ASCII Art Gallery\n"
        @input = ""
        until @input == "exit"
            while ArtViewer.layer.to_i < 3
                get_categories
                list_categories
                get_user_input
            end
            get_art
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
        (ArtViewer::Category.all).each.with_index(1) do |category, index|
            puts "#{index}. #{category.name}"
        end
        puts "\n"
    end

    def get_user_input
        @selection = gets.strip.to_i
        puts "\n"
        ArtViewer.extension=(@categories[@selection - 1].ref)
        if @categories[@selection - 1].val == '<'
            ArtViewer.incrementLayer
        elsif @categories[@selection - 1].val == '@'
            ArtViewer::Category.delete
        end
    end

    def get_art
        ArtViewer::Art.all
    end

    def display_art
        (ArtViewer::Art.all).each do |art|
            puts "#{art.body}\n\n"
        end
    end

    def continue
        puts "Would you like to continue? Type 'exit' to exit or hit any key to restart"
        @input = gets.strip
        ArtViewer::Category.delete
        ArtViewer::Art.delete
        ArtViewer.layer=(1)
        ArtViewer.extension=("/")
    end

    def cease
        puts "Thank you for using."
    end
    
end