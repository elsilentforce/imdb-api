# Preview all emails at http://localhost:3000/rails/mailers/movie_detail_mailer
class MovieDetailMailerPreview < ActionMailer::Preview
  
  def pdf_report
    movie = MovieFinder.call(movie_sample)
    MovieDetailMailer.pdf_report(recipient: 'someuser@somemail.com', movie: movie)
  end

  private

  def movie_sample
    [
      'tt0126029', # Shrek
      'tt0298148', # Shrek 2
      'tt0413267', # Shrek the Third
      'tt0892791' # Shrek Forever After
    ].sample
  end
end
