ActiveAdmin.register Book do
  filter :title
  filter :is_active
  scope :all

  scope :active
  scope :inactive

  index download_links: [:csv] do
    column :title
    column "Authors", :authors do |book|
      book.authors.map { |author| [author.first_name, author.last_name].compact.join(" ") }.join(", ")
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
    column "Active Status", :active?
    actions defaults: true do |book|
      if book.is_active?
        item "Deactivate", deactivate_admin_book_path(book), method: :put
      else
        item "Activate", activate_admin_book_path(book), method: :put
      end
    end
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
      f.input :is_active, as: :boolean, label: "Active"
      f.input :genre_ids, as: :select, collection: Genre.all, input_html: { multiple: true }
      f.input :author_ids, as: :select, collection: Author.all, input_html: { multiple: true }
      # Other fields as needed
    end
    f.actions
  end

  # Custom member action to activate a book
  member_action :activate, method: :put do
    resource.activate!
    redirect_to admin_books_path, notice: "Book activated successfully."
  end

  # Custom member action to deactivate a book
  member_action :deactivate, method: :put do
    resource.deactivate!
    redirect_to admin_books_path, notice: "Book deactivated successfully."
  end
end
