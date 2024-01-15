class CreateBookAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :book_authors do |t|
      t.belongs_to :book
      t.belongs_to :author
      t.timestamps
    end
  end
end
