class Country < ApplicationRecord
  scope :name_like, -> (query) { where("name LIKE ?", "%#{query}%") }
end
