ActiveAdmin.register Book do
  index do
    column :title
    column "Author", :authors
    column "Publisher", :publisher
    column :isbn
    column :rating do |book|
      div :class => "price" do 
        number_to_currency book.rating       
      end
    end
    column :genres

    column :total_pages
    actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :total_pages, :rating, :isbn, :published_date, :publisher_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :total_pages, :rating, :isbn, :published_date, :publisher_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :title, :author_id, :published_date, :isbn, :rating, :total_pages, :publisher_id, :genre_ids => []
end
