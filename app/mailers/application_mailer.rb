class ApplicationMailer < ActionMailer::Base
  default from: 'Movie Reviews <no-reply@moviereviews.cc>'
  layout 'mailer'
end
