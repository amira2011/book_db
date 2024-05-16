# frozen_string_literal: true

ActiveAdmin.register ApiToken do
  menu priority: 3
  config.per_page = 30

  permit_params :name, :is_active

  filter :name
  filter :created_at
  filter :updated_at

  action_item "Activate", only: [:show] do
    link_to "Activate", activate_admin_api_token_path(api_token) unless api_token.active?
  end

  action_item "Deactivate", only: [:show] do
    link_to "Deactivate", deactivate_admin_api_token_path(api_token) if api_token.active?
  end

  index download_links: [:csv] do
    selectable_column
    column :id
    column :name
    column :is_active
    column :created_at
    column :updated_at
    actions defaults: true do |api_token|
      span link_to "Activate", activate_admin_api_token_path(api_token) unless api_token.active?
      span link_to "Deactivate", deactivate_admin_api_token_path(api_token) if api_token.active?
    end
  end

  show do
    columns do
      column do
        attributes_table do
          row :id
          row :name
          row :is_active
          row :created_at
          row :updated_at
        end
      end

      column do
        if params[:token].present?
          panel "Token" do
            h4(style: "color: red") { "Please copy the bearer token now. It will not be shown later.<br/>".html_safe }
            span params[:token]
          end
        end
      end
    end

    active_admin_comments
  end

  form do |_f|
    columns do
      column do
        inputs do
          input :name
          input :is_active
        end
        actions
      end
      column do
      end
    end
  end

  controller do
    def create
      create!(notice: "Api token has been created successfully!") do
        admin_api_token_path(@api_token, token: @api_token.new_token)
      end
    end
  end

  member_action :activate do
    @api_token = ApiToken.find(params[:id])
    @api_token.activate!
    redirect_to admin_api_token_path(@api_token)
  end

  member_action :deactivate do
    @api_token = ApiToken.find(params[:id])
    @api_token.deactivate!
    redirect_to admin_api_token_path(@api_token)
  end
end
