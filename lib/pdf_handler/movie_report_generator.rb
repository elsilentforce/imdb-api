module PdfHandler
  class MovieReportGenerator < PdfLib
    # Generates a PDF file using a Movie object
    def initialize(movie)
      @movie = movie
    end

    def call
      generate_file
    end

    private
    
    def generate_file
      doc = Prawn::Document.new
      doc.text "
        Movie Title: #{@movie["Title"]}
        Year: #{@movie['Year']}
        Genre: #{@movie['Genre']}
      "
      doc.render_file "aaaa #{custom_timestamp}.pdf"
    end

    def custom_timestamp
      Time.now.strftime("%Y%m%d_%H%M%S")
    end
    

  end
end
