class Note < ApplicationRecord
  validates_presence_of :imdb_id, :title
  validates_uniqueness_of :imdb_id
  validates :raiting,
    numericality: { only_integer: true },
    length: { 
      minimum: 1,
      maximum: 5,
      message: 'Raiting must be between 1 and 5 stars.' 
    },
    allow_nil: true

  validate do |note|
    cannot_comment_msg = "Cannot rate or comment a Movie you have not watched yet."
    errors.add :comment, cannot_comment_msg if note.watched === false
    errors.add :raiting, cannot_comment_msg if note.watched === false
  end

  def has_comments?
    self.watched && self.comment
  end

  def has_ratings?
    self.watched && self.raiting
  end

  def status
    self.watched ? 'watched' : 'not watched'
  end

end
