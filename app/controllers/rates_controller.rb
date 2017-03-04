class RatesController < ApplicationController
  before_action :set_book, only: [:create]

  # POST /rates
  def create
    @new_rate = @book.rates.build(rate_params)
    @new_rate.user = current_user

    if @new_rate.save
      ratings = Rate.where(book_id: @book.id).collect(&:rating)
      @book.av_rating = ratings.sum/ratings.count
      @book.save
      redirect_to @book
    else
      render 'books/show', alert: 'Что-то не так'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rate
      @rate = @book.rate.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end

    # Only allow a trusted parameter "white list" through.
    def rate_params
      params.require(:rate).permit(:rating)
    end
end
