class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :total_pages
      t.float :rating
      t.string :isbn
      t.date :published_date
      t.belongs_to :publisher

      t.timestamps
    end
  end
end
