class Author < ApplicationRecord
  validates :name, :surname, :slug, presence: true
  validates :slug, uniqueness: true

  has_and_belongs_to_many :books, join_table: 'authors_books'
end
