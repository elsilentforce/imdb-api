class MovieDetailMailer < ApplicationMailer
  def pdf_report(recipient:,movie:)
    @movie = movie
    movie_title = @movie['Title']
    imdb_id = @movie['imdbID']
    timestamp = Time.now.strftime("%Y%m%d_%H%M%S")
    note = Note.find_by(imdb_id: imdb_id)
    pdf_file = PdfHandler::MovieReportGenerator.call(movie: @movie, note: note)
    filename = [movie_title, 'PDF Report', timestamp].join(' ')

    attachments["#{filename}.pdf"] = { content_type: 'application/pdf', content: pdf_file }
    mail(to: recipient, subject: "#{ filename }.pdf")
  end
end
