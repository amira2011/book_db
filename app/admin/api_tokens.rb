# app/admin/api_token.rb

ActiveAdmin.register ApiToken do
  # Define what to display in the index view
  index do
    selectable_column
    id_column
    column :name
    column :token
    column :is_active
    column :last_accessed_at
    column :accessed_by_ips
    actions
  end

  # Define the form for editing or creating a resource
  form do |f|
    f.inputs do
      f.input :name

      f.input :is_active
    end
    f.actions
  end

  # Define which attributes to display in the show view
  show do
    attributes_table do
      row :name
      row :token
      row :is_active
      row :last_accessed_at
      row :accessed_by_ips
    end
  end

  # Define which attributes are permitted for strong parameters
  permit_params :name, :token, :is_active, :last_accessed_at, :accessed_by_ips

  # Define any filters for the index view
  filter :name
  filter :token
  filter :is_active
  filter :last_accessed_at
  filter :accessed_by_ips
end
