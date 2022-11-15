class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
  validate :click_bait

  def click_bait
    if title == "True Facts"
      errors.add(:title, "Not allowed")
    end
  end
end
