class ArtViewer::CLI
    attr_accessor  :selection, :categories, :extension

    @selection = ""
    @categories = []


#    def self.layer
#        return ArtViewer.layer
#    end

#    def self.incrementLayer
#        ArtViewer.layer = ArtViewer.layer.to_i + 1
#    end

    def call
        puts "Welcome to the ASCII Art Gallery"
        @input = ""
        until @input == "exit"
            while ArtViewer.layer.to_i <= 3
                get_categories
                list_categories
                get_user_input
                #binding.pry
            end
            display_art
            continue
        end 
        cease
    end

    def get_categories
        puts ArtViewer.layer
        @categories = ArtViewer::Category.all
    end
    
    def list_categories
        if ArtViewer.layer == 1
            puts "Select a category."
        else
            puts "Select a subcategory."
        end
       # puts "fun #{ArtViewer::Category.all(@extension)}"
        (ArtViewer::Category.all).each.with_index(1) do |category, index|
            puts "#{index}. #{category.name}"
        end
    end

    def get_user_input
        @selection = gets.strip.to_i
        ArtViewer.extension=(@categories[@selection - 1].ref)
        if @categories[@selection - 1].val == '<'
            puts "increment"
            ArtViewer.incrementLayer
        elsif @categories[@selection - 1].val == '@'
            ArtViewer::Category.delete
        end
    end

    def display_art

    end

    def continue
        puts "Would you like to continue? Type 'exit' to exit or hit any key to restart"
        @input = gets.strip
    end

    def cease

    end
    
end