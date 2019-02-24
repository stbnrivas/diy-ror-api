require 'test_helper'

class AuthorsBooksTest < ActiveSupport::TestCase
  def test_valid_author_respond_to_books
    assert Author.new(name: 'valid', surname: 'valid', slug: 'valid-valid').respond_to? :books
  end
  def test_valid_book_respond_to_authors
    assert Book.new(title: 'valid title', brief: 'a valid brief of book', slug: 'valid-title').respond_to? :authors
  end
  def test_valid_author_can_add_to_book
    a = Author.new(name: 'valid author 1', surname: 'valid', slug: 'valid-valid')
    b = Book.new(title: 'valid title 1', brief: 'a valid brief of book', slug: 'valid-title')
    assert a.books << b
  end
  def test_valid_book_can_add_author
    a = Author.new(name: 'valid author 2', surname: 'valid', slug: 'valid-valid')
    b = Book.new(title: 'valid title 2', brief: 'a valid brief of book', slug: 'valid-title')
    assert b.authors << a
  end
  def test_valid_book_can_add_multiple_authors
    a3 = Author.new(name: 'valid author 3', surname: 'valid', slug: 'valid-valid')
    a4 = Author.new(name: 'valid author 4', surname: 'valid', slug: 'valid-valid')
    b = Book.new(title: 'valid title 3', brief: 'a valid brief of book', slug: 'valid-title')
    assert b.authors << a3
    assert b.authors << a4
  end
  def test_valid_author_can_add_multiple_books
    a5 = Author.new(name: 'valid author 5', surname: 'valid', slug: 'valid-valid')
    b5_1 = Book.new(title: 'valid title 5', brief: 'a valid brief of book', slug: 'valid-title')
    b5_2 = Book.new(title: 'valid title 6', brief: 'a valid brief of book', slug: 'valid-title')
    assert a5.books << b5_1
    assert a5.books << b5_2
  end
end
