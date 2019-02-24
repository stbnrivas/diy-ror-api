class Book < ApplicationRecord
  validates :title, :slug, presence: true , uniqueness: true
end
