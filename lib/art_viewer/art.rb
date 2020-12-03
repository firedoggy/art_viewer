class ArtViewer::Art
    attr_accessor :ref, :body

    def initialize(ref, body)
        @ref = ref
        @body = body
    end
end