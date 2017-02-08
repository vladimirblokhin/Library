class UserBooksController < ApplicationController
  before_action :set_user, only: [:create, :update, :destroy]
  before_action :set_user_book, only: [:update, :destroy]

  # GET /user_books/1/edit
  def edit
  end

  # POST /user_books
  def create
    @user_book = UserBook.new(user_book_params)
  end

  # PATCH/PUT /user_books/1
  def update
    @user_book.update(user_book_params)
  end

  # DELETE /user_books/1
  def destroy
    @user_book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_book
      @user_book = @user.user_book.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_book_params
      params.require(:user_book).permit(:list_type)
    end
end
