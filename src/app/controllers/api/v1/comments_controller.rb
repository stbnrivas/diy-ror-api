class Api::V1::CommentsController < ApplicationController
  before_action :set_default_format_response_json
  # TODO: remove below when add authentication
  skip_before_action :verify_authenticity_token

  def index
    @comments = Comment.where("book_id = ?",params[:book_id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments, status: 200 }
    end
  end

  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      render json: {"msg":"comment added"}, status: 200
    else
      render json: {"msg":"add comment failure"}, status: 500
    end
  end

private
  def set_default_format_response_json
    request.format = :json
  end

  def comments_params
    params.permit(:book_id,:content,:made_by)
  end
end
