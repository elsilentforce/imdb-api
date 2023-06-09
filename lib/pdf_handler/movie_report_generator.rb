module PdfHandler
  class MovieReportGenerator < PdfLib
    # Generates a PDF file using a Movie object and personal Notes (Optional)

    require 'open-uri'
    
    def initialize(movie: ,note: nil)
      @movie = movie
      @note = note
    end

    def call
      generate_file
    end

    private
    
    def generate_file
      doc = Prawn::Document.new
      doc.image URI.open(@movie['Poster']) if @movie['Poster']
      doc.text "
        Movie Title: #{@movie["Title"]}
        Year: #{@movie['Year']}
        Genre: #{@movie['Genre']}
      "

      if @note.present?
        doc.text "You have #{@note.status} this movie.", :strong
        doc.text "Personal rating: #{@note.raiting} Stars" if @note.has_ratings?
        doc.text "Personal comment: #{@note.comment}" if @note.has_comments?
      end

      Tempfile.create do |f|
        doc.render_file f
        f.flush
        File.read f
      end
    end

  end
end
