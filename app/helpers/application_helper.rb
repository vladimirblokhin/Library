module ApplicationHelper
  def book_pic(book)
    if book.image?
      book.image
    else
      asset_path ('nopic.jpg')
    end
  end
end
