class Api::V1::BooksController < ApplicationController
  before_action :set_default_format_response_json
  # TODO: remove below when add authentication
  skip_before_action :verify_authenticity_token

  def index
    @books = Book.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books, status: 200 }
    end
  end

  def show
    @book = Book.find_by(slug: params[:id])
    @book = Book.find params[:id] if @book.nil?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book, status: 200 }
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      render json: @book, status: 200
    else
      render json: @book, status: 500
    end
  end

  def destroy
    @book = Book.find_by(slug: params[:id])
    if @book.nil?
      render json: {msg: "book not found"}, status: 404
    else
      @book.destroy
      render json: {msg: "book was deleted"}, status: 200
    end
  end

private
  def set_default_format_response_json
    request.format = :json
  end

  def book_params
    params.permit(:title,:brief,:slug)
  end
end
