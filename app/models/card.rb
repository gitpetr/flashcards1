class Card < ApplicationRecord
  validates :original, :translated, :review, presence: true
  validates :original, :translated, uniqueness: { case_sensitive: false }

  validate :on_review, on: :create

  before_validation  :no_equal
  scope :for_review, -> { where( 'review <= ?', Time.now ) }

  def comparison(txt)
    if self.original == txt
        self.update_attributes(review: 3.days.from_now)
     end
  end

  protected

  def on_review
    self.review = 3.days.from_now
  end

  def no_equal
    if self.original.downcase == self.translated.downcase
      self.errors.add( :original, 'Оригинальный и переведённый тексты не должны быть равны друг другу')
    end
  end
end
