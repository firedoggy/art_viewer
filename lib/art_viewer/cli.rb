class ArtViewer::CLI
    def call
        puts "Welcome to the ASCII Art Gallery"
        @input = ""
        until @input == "exit"
            get_categories
            list_categories
            get_user_category
            #what_next
        end 
        cease
    end

    def get_categories

    end
    
    def list_categories

    end

    def get_user_category

    end

    #def what_next

    #end

    def cease

    end
    
end