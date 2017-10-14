ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :approved, :tag_list

  action_item :Approve, only: :show do 
    link_to "Approve", Approve_admin_user_path(user), method: :put if !user.approved?
  end
  
  action_item :UnApprove, only: :show do 
    link_to "UnApprove", UnApprove_admin_user_path(user), method: :put if user.approved?
  end
  
  member_action :Approve, method: :put do
    user = User.find(params[:id])
    user.update(approved: 1)
    redirect_to admin_user_path(user)
  end 

  member_action :UnApprove, method: :put do
    user = User.find(params[:id])
    user.update(approved: 0)
    redirect_to admin_user_path(user)
  end
  
  form do |f|
    f.inputs 'Account' do
      f.input :email
      f.input :tag_list, placeholder: 'Tags (Separated By Commas)', input_html: { value: user.tag_list.join(", ") }
      f.input :approved
    end
    if f.object.id.nil?
        f.inputs "Password" do
        f.input :password,              :label => "Password"
        f.input :password_confirmation, :label => "Password Confirmation"
      end
    end
    f.actions
  end
  
  index do
    selectable_column
    column :email
    column :encrypted_password
    column :approved
    column :tag_list
    actions
  end
  
  show do
    attributes_table do
      row :email
      row :password
      row :approved
      row :tag_list
    end
    active_admin_comments
  end
  
  filter :email, as: :select, collection: proc { User.all.map(&:email) }
  filter :approved
end
