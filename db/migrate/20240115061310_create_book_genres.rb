class CreateBookGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :book_genres do |t|
      t.belongs_to :book
      t.belongs_to :genre
      t.timestamps
    end
  end
end
