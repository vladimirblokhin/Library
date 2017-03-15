class ListsController < ApplicationController
  before_action :set_book, only: [:create, :destroy]
  before_action :set_list, only: [:destroy]

  # POST
  def create
    @new_list = @book.lists.build(list_params)
    @new_list.user = current_user

    if @new_list.save
      render 'books/show'
    end
  end

  # DELETE
  def destroy
    if current_user_can_edit?(@list)
      @list.destroy
      render 'books/show'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = @book.lists.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  # Only allow a trusted parameter "white list" through.
  def list_params
    params.require(:list).permit(:list_type)
  end
end
