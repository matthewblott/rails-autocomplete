class Movie < ApplicationRecord
  scope :filter_by_title, -> (title) { where("title LIKE ?", "%#{title}%") }
end
