class AddAvRatingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :av_rating, :float
  end
end
