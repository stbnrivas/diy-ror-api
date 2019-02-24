class Book < ApplicationRecord
  validates :title, :slug, presence: true , uniqueness: true

  has_and_belongs_to_many :authors, join_table: 'authors_books'
end
