class Note < ApplicationRecord

  def has_personal_ratings?
    self.watched && (self.comment || self.raiting)
  end

end
