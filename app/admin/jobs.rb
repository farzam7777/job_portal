ActiveAdmin.register Job do
  permit_params :title, :description, :job_type, :day, :location, 
  :payment, :start_date, :end_date, :start_time, :status, :tag_list

  index do
    selectable_column
    column :title
    column :description
    column :tag_list
    column :job_type
    column :day
    column :location
    column :payment
    column :start_date
    column :end_date
    column :start_time
    column :status
    actions
  end

  form do |f|
    f.inputs 'Job Details' do
      f.input :title
      f.input :description
      f.input :tag_list, placeholder: 'Tags (Separated By Commas)', input_html: { value: job.tag_list.join(", ") }
      f.input :job_type, as: :select, collection: ['Fixed', 'Hourly'], include_blank: false
      f.input :day, as: :select, collection: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'], include_blank: false
      f.input :location
      f.input :payment
      f.input :start_date, :as => :date_picker, input_html: { style: 'width: 78% !important' }
      f.input :end_date, :as => :date_picker, input_html: { style: 'width: 78% !important' }
      f.input :start_time, :as => :time_picker
      f.input :status, as: :select, collection: ['Available', 'Pending', 'Complete'], include_blank: false
    end
    f.actions
  end
  
  filter :title
  filter :description
  filter :base_tags
  filter :job_type, as: :select, collection: ['Fixed', 'Hourly']
  filter :day, as: :select, collection: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  filter :location
  filter :payment
  filter :start_date
  filter :end_date
  filter :start_time
  filter :status, as: :select, collection: ['Available', 'Pending', 'Complete']
end
