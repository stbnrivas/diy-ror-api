require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def test_valid_author
    assert Author.new(name: 'valid', surname: 'valid', slug: 'valid-valid').valid?
  end
  def test_invalid_author_name_empty
    refute Author.new(name: nil, surname: 'partial_valid', slug: '-partial_valid').valid?
  end
  def test_invalid_author_surname_empty
    refute Author.new(name: 'partial_valid', surname: nil, slug: 'partial_valid-').valid?
  end
  def test_invalid_author_uniqueness_slug
    assert Author.new(name: 'valid1', surname: 'valid1', slug: 'invalid-slug').save
    refute Author.new(name: 'valid2', surname: 'valid2', slug: 'invalid-slug').valid?
  end
end
