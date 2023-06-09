class MovieDetailMailerJob
  include Sidekiq::Job

  queue_as :default

  def perform(*args)
    recipient, movie = args.first[:recipient], args.first[:movie]
    MovieDetailMailer.pdf_report(recipient: recipient, movie: movie).deliver_now
  end

end
