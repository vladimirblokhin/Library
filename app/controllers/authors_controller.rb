class AuthorsController < ApplicationController
  before_action :set_author, only: [:create]

  # POST /authors
  def create
    @author = Author.new(author_params)
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def author_params
      params.require(:author).permit(:name)
    end
end
