class AddBookAuthorsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :book_authors, :string
  end
end
