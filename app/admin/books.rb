ActiveAdmin.register Book do
  filter :title

  index download_links: [:csv] do
    column :title
    column "Authors", :authors do |book|
      book.authors.map(&:first_name).join(", ")
    end
    column "Publisher", :publisher do |book|
      book.publisher.name
    end
    column :isbn
    column :rating
    column "Genres", :genres do |book|
      book.genres.map(&:genre_name).join(", ")
    end
    column :total_pages
    actions
  end

  permit_params :title, :publisher_id, :published_date, :isbn, :rating, :total_pages, genre_ids: [], authors: []
end
