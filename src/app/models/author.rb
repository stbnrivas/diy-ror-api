class Author < ApplicationRecord
  validates :name, :surname, :slug, presence: true
  validates :slug, uniqueness: true

end
