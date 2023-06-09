class Note < ApplicationRecord

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
