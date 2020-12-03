class ArtViewer::Category
    attr_accessor :name, :ref
    @@all = []
     
    def initialize(name, ref)
      @name = name
      @ref = ref
      save
    end 

    def self.all
        return @@all
    end

    def save
        @@all << self
    end
end
   