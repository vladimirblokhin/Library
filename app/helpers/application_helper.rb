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

  def rating_from_user(user, book)
    Rate.where(user_id: user.id, book_id: book.id).rating
  end
end
