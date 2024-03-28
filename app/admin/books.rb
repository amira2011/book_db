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

  permit_params :title, :publisher_id, :published_date, :isbn, :rating, :total_pages, genre_ids: [], author_ids: []

  form do |f|
    f.inputs do
      f.input :title
      f.input :publisher
      f.input :published_date, as: :datepicker
      f.input :isbn
      f.input :rating
      f.input :total_pages
      f.input :genre_ids, as: :select, collection: Genre.all, input_html: { multiple: true }
      f.input :author_ids, as: :select, collection: Author.all, input_html: { multiple: true }
      # Other fields as needed
    end
    f.actions
  end
end
