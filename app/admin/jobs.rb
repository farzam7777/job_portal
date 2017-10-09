ActiveAdmin.register Job do
  permit_params :title, :description, :job_type, :day, :location, 
  :payment, :start_date, :end_date, :start_time, :status, :tag_list

  index do
    selectable_column
    column 'Job Title', :title
    column 'Job Description', :description
    column 'Job Tags List', :tag_list
    column 'Pay - Fixed / HR', :job_type
    column 'Job Day', :day
    column 'Job Location', :location
    column 'Payment', :payment
    column 'Job Date', :start_date
    column 'Job End Date', :end_date
    column 'Job Start Time', :start_time
    column 'Job Status', :status
    actions
  end

  form do |f|
    f.inputs 'Job Details' do
      f.input :title, label: 'Job Title'
      f.input :description, label: 'Job Description'
      f.input :tag_list, placeholder: 'Tags (Separated By Commas)', input_html: { value: job.tag_list.join(", ") }, label: 'Job Tag List'
      f.input :job_type, as: :select, collection: ['Fixed', 'Hourly'], include_blank: false, label: 'Pay - Fixed / HR'
      f.input :day, as: :select, collection: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'], include_blank: false, label: 'Job Day'
      f.input :location, label: 'Job Location'
      f.input :payment, label: 'Payment'
      f.input :start_date, :as => :date_picker, input_html: { style: 'width: 78% !important' }, label: 'Job Date'
      f.input :end_date, :as => :date_picker, input_html: { style: 'width: 78% !important' }, label: 'Job End Date'
      f.input :start_time, :as => :time_picker, label: 'Job Start Time'
      f.input :status, as: :select, collection: ['Available', 'Pending', 'Complete'], include_blank: false, label: 'Job Status'
    end
    f.actions
  end
  
  show do
    attributes_table do
      row "Job Title" do
        job.title
      end
      row "Job Description" do
        job.description
      end
      row "Job Tags List" do
        job.tag_list
      end
      row "Pay - Fixed / HR" do
        job.job_type
      end
      row "Job Day" do
        job.day
      end
      row "Job Location" do
        job.location
      end
      row "Job Payment" do
        job.payment
      end
      row "Job Date" do
        job.start_date
      end
      row "Job End Date" do
        job.end_date
      end
      row "Job Start Time" do
        job.start_time
      end
      row "Job Status" do
        job.status
      end
    end
    active_admin_comments
  end
  
  filter :title, label: 'Job Title'
  filter :description, label: 'Job Description'
  filter :base_tags, label: 'Job Tags List'
  filter :job_type, as: :select, collection: ['Fixed', 'Hourly'], label: 'Pay - Fixed / HR'
  filter :day, as: :select, collection: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'], label: 'Job Day'
  filter :location, label: 'Job Location'
  filter :payment, label: 'Payment'
  filter :start_date, label: 'Job Date'
  filter :end_date, label: 'Job End Date'
  filter :start_time, label: 'Job Start Time'
  filter :status, as: :select, collection: ['Available', 'Pending', 'Complete'], label: 'Job Status'
end
