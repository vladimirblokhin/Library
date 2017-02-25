class UserBooksController < ApplicationController
  before_action :set_book, only: [:create, :destroy]
  before_action :set_user_book, only: [:destroy]

  # POST /user_books
  def create
    @new_user_book = @book.user_books.build(user_book_params)
    @new_user_book.user = current_user

    if @new_user_book.save
      render 'books/show'
    end
  end

  # DELETE /user_books/
  def destroy
    if current_user_can_edit?(@user_book)
      @user_book.destroy
      render 'books/show'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_book
      @user_book = @book.user_book.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_book_params
      params.require(:user_book).permit(:list_type)
    end
end
