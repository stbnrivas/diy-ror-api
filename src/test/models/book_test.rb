require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def test_valid_book
    assert Book.new(title: 'valid title', brief: 'a valid brief of book', slug: 'valid-title').valid?
  end
  def test_invalid_book_title_nil
    refute Book.new(title: nil, brief: 'a valid brief of book', slug: 'valid-title').valid?
  end
  def test_invalid_book_title_uniqueness
    assert Book.new(title: 'book valid 1', brief: 'a valid brief of book', slug: 'book-valid-1').save
    refute Book.new(title: 'book valid 1', brief: 'a valid brief of book', slug: 'book-valid-2').valid?
  end
  def test_invalid_book_title_empty
    refute Book.new(title: '', brief: 'a valid brief of book', slug: 'valid-title').valid?
  end
  def test_invalid_book_slug_nil
    refute Book.new(title: nil, brief: 'a valid brief of book', slug: nil).valid?
  end
  def test_invalid_book_slug_empty
    refute Book.new(title: '', brief: 'a valid brief of book', slug: '').valid?
  end
  def test_invalid_book_slug_uniqueness
    assert Book.new(title: 'book valid 1', brief: 'a valid brief of book', slug: 'book-valid-1').save
    refute Book.new(title: 'book valid 2', brief: 'a valid brief of book', slug: 'book-valid-1').valid?
  end
end
