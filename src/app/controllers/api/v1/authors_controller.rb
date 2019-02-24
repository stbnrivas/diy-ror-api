class Api::V1::AuthorsController < ApplicationController
  before_action :set_default_format_response_json
  # TODO: remove below when add authentication
  skip_before_action :verify_authenticity_token

  def index
    unless params[:book_id].nil?
      @book = Book.find_by(id: params[:book_id])
      @book ||= Book.find_by(slug: params[:book_id])
      @authors = @book.authors
    else
      @authors = Author.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authors, status: 200 }
    end
  end

  def show
    @author = Author.find_by(slug: params[:id])
    @author = Author.find params[:id] if @author.nil?
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @author, status: 200 }
    end
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author, status: 200
    else
      render json: @author, status: 500
    end
  end

  def destroy
    @author = Author.find_by(slug: params[:id])
    if @author.nil?
      render json: {msg: "author not found"}, status: 404
    else
      @author.destroy
      render json: {msg: "author was deleted"}, status: 200
    end
  end

private
  def set_default_format_response_json
    request.format = :json
  end

  def author_params
    params.permit(:name,:surname,:slug)
  end
end
