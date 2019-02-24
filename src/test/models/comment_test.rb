require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def test_valid_comment_with_writer
    b = Book.new(title: 'valid title', brief: 'a valid brief of book', slug: 'valid-title')
    assert Comment.new(book: b, content: 'not empty', made_by: 'anonymous').valid?
  end
  def test_valid_comment_without_writer
    b = Book.new(title: 'valid title', brief: 'a valid brief of book', slug: 'valid-title')
    assert Comment.new(book: b, content: 'not empty', made_by: nil).valid?
  end
  def test_invalid_comment_content_nil
    b = Book.new(title: 'valid title', brief: 'a valid brief of book', slug: 'valid-title')
    refute Comment.new(book: b, content: nil, made_by: nil).valid?
  end
  def test_invalid_comment_content_empty
    b = Book.new(title: 'valid title', brief: 'a valid brief of book', slug: 'valid-title')
    refute Comment.new(book: b, content: '', made_by: nil).valid?
  end
  def test_invalid_comment_without_book_association
    refute Comment.new(content: '', made_by: nil).valid?
  end
end
