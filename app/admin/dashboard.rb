# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Books" do
          ul do
            Book.recent(5).map do |book|
              li link_to(book.title, admin_book_path(book))
            end
          end
        end
      end

      column do
        panel "Publishers Summary" do
          div do
            "Total Publishers: #{Publisher.count}"
          end
          div do
            "Recently Added Publisher: #{Publisher.order(created_at: :desc).first&.name || "None"}"
          end
        end
      end
    end
  end # content
end
