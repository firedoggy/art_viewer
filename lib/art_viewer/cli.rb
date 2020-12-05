class ArtViewer::CLI
    attr_accessor  :input, :categories, :art  
    @input = ""
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
        status = false
        while status == false
            @input = gets.strip.to_i
            puts "\n"
            status = @input.between?(1, (ArtViewer::Category.all).size)
            unless status
                puts "Invalid selection."
            end
        end

        ArtViewer.extension=(@categories[@input - 1].ref)
        if @categories[@input - 1].val == '<'
            ArtViewer.incrementLayer
        elsif @categories[@input - 1].val == '@'
            ArtViewer::Category.delete
        end
    end

    def get_art
        ArtViewer::Art.all
    end

    def display_art
        if (ArtViewer::Art.all).size > 1
            status = false
            while status == false
                puts "Select which piece of art you'd like to see (1 - #{(ArtViewer::Art.all).size}) or select 0 to see all.\n"
                @input = gets.strip.to_i
                puts "\n"
                status = @input.between?(0, (ArtViewer::Art.all).size)
            end
        end

        if @input == 0 || (ArtViewer::Art.all).size == 1
            (ArtViewer::Art.all).each.with_index(1) do |art, index|
                puts "#{index}. #{art.body}\n\n"
            end
        else
            puts "#{@input}. #{(ArtViewer::Art.all[@input - 1]).body}\n\n"
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