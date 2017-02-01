class CommentsController < ApplicationController
  before_action :authenticate_user!, expect: [:show, :index]
  before_action :set_book, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  # POST /comments
  def create
    @new_comment = @book.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      redirect_to @book, notice: 'Comment was successfully created.'
    else
      render 'books/show', alert: 'Something went wrong! Try again.'
    end
  end

  private
    def set_book
      @book = Book.find(params[:book_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @book.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
