# Preview all emails at http://localhost:3000/rails/mailers/movie_detail_mailer
class MovieDetailMailerPreview < ActionMailer::Preview
  def pdf_report
    movie = MovieFinder.call('tt0126029')
    email = 'sometestuser@somemail.com'
    MovieDetailMailer.pdf_report(recipient: email, movie: movie)
  end
end
