module ApplicationHelper
  def book_pic(book)
    if book.image?
      book.image
    else
      asset_path ('nopic.jpg')
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
