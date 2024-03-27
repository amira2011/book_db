ActiveAdmin.register Author do
   filter :middle_name_cont, as: :string

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :middle_name, :last_name
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :middle_name, :last_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
