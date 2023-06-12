# Preview all emails at http://localhost:3000/rails/mailers/movie_detail_mailer
class MovieDetailMailerPreview < ActionMailer::Preview
  def pdf_report
    movie = MovieFinder.call(sample_movie)
    email = 'sometestuser@somemail.com'
    MovieDetailMailer.pdf_report(recipient: email, movie: movie)
  end

  private

  def sample_movie
    [
      'tt0126029', # Shrek
      'tt0298148', # Shrek 2
      'tt0413267', # Shrek the Third
      'tt0892791' # Shrek Forever After
    ].sample
  end
end
