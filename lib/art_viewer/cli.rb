class ArtViewer::CLI
    attr_accessor  :input, :categories, :art  
    @input = ""
    @categories = []
    @art = []


    def call
        puts "\n\n        __          __  _                            _          _   _                      _____  _____ _____ _____                 _      _____       _ _                 
        \\ \\        / / | |                          | |        | | | |              /\\    / ____|/ ____|_   _|_   _|     /\\        | |    / ____|     | | |                
         \\ \\  /\\  / /__| | ___ ___  _ __ ___   ___  | |_ ___   | |_| |__   ___     /  \\  | (___ | |      | |   | |      /  \\   _ __| |_  | |  __  __ _| | | ___ _ __ _   _ 
          \\ \\/  \\/ / _ \\ |/ __/ _ \\| '_ ` _ \\ / _ \\ | __/ _ \\  | __| '_ \\ / _ \\   / /\\ \\  \\___ \\| |      | |   | |     / /\\ \\ | '__| __| | | |_ |/ _` | | |/ _ \\ '__| | | |
           \\  /\\  /  __/ | (_| (_) | | | | | |  __/ | || (_) | | |_| | | |  __/  / ____ \\ ____) | |____ _| |_ _| |_   / ____ \\| |  | |_  | |__| | (_| | | |  __/ |  | |_| |
            \\/  \\/ \\___|_|\\___\\___/|_| |_| |_|\\___|  \\__\\___/   \\__|_| |_|\\___| /_/    \\_\\_____/ \\_____|_____|_____| /_/    \\_\\_|   \\__|  \\_____|\\__,_|_|_|\\___|_|   \\__, |
                                                                                                                                                                      __/ |
                                                                                                                                                                     |___/ \n\n"

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
            puts "\nSelect a category\n-----------------"
        else
            puts "\nSelect a subcategory\n--------------------"
        end

        (@categories).each.with_index(1) do |category, index|
            puts "#{index}. #{category.name}"
        end
        puts "\n"
    end

    def get_user_input
        begin
            @input = gets.chomp
            @input = Integer(@input)
            rescue ArgumentError
                puts "\nPlease enter a valid input\n"
                retry
        end

        until @input.between?(1, (@categories).size)    
            puts "\nPlease enter a valid input"
            @input = gets.chomp.to_i
        end
        
        ArtViewer.extension=(@categories[@input - 1].ext)
        if @categories[@input - 1].val == '<'
            ArtViewer.incrementLayer
        end
        ArtViewer::Category.delete
    end

    def get_art
        @art = ArtViewer::Art.all
    end

    def display_art
        if (@art).size > 1
            puts "\nSelect which piece of art you'd like to see (1 - #{(@art).size}) or select 0 to see all.\n"
            begin
                @input = gets.chomp
                @input = Integer(@input)
                rescue ArgumentError
                    puts "\nPlease enter a valid input\n"
                    retry
            end
            
            puts "\n"
            until @input.between?(0, (@art).size)
                puts "Please enter a valid input"
                @input = gets.chomp.to_i
                puts "\n"
            end
        end

        if @input == 0 || (@art).size == 1
            (@art).each.with_index(1) do |art, index|
                puts "\n#{index}.\n#{art.body}\n"
            end
        else
            puts "\n#{@input}.\n#{(@art[@input - 1]).body}\n"
        end
    end
    
    def continue
        puts "\nWould you like to continue? Type 'exit' to exit or hit any key to restart.\n"
        @input = gets.strip
        ArtViewer::Category.delete
        ArtViewer::Art.delete
        ArtViewer.layer=(1)
        ArtViewer.extension=("/")
    end

    def cease
        puts "\nThank you for using."
    end
    
end