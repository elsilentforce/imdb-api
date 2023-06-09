class MovieDetailMailer < ApplicationMailer
  def pdf_report(recipient: , movie:)
    @movie = movie
    note = Note.find_by(imdb_id: @movie['imdbID'])
    pdf_file = PdfHandler::MovieReportGenerator.call(movie: @movie, note: note)
    timestamp = Time.now.strftime("%Y%m%d_%H%M%S")
    filename = [@movie['Title'], timestamp].join(' ')

    attachments["#{filename}.pdf"] = { content_type: 'application/pdf', content: pdf_file }
    mail(to: recipient, subject: "#{@movie['Title']} PDF Report")
  end
end
