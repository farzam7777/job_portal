ActiveAdmin.register AssignedJob do
	permit_params :user_id, :job_id, :payment, :total_hours, :job_status, :payment_status, :pay_slip

  scope :admin_report_payment_pending
  scope :admin_report_payment_complete

	action_item :Complete, only: :show do 
    link_to "Mark Complete", Complete_admin_assigned_job_path(assigned_job), method: :put if assigned_job.job_status == 'Pending'
  end

  action_item :Pending, only: :show do 
    link_to "Mark Pending", Pending_admin_assigned_job_path(assigned_job), method: :put if assigned_job.job_status == 'Complete'
  end

  member_action :Complete, method: :put do
    assigned_job = AssignedJob.find(params[:id])
    assigned_job.update(job_status: 'Complete')   
    redirect_to admin_assigned_job_path(assigned_job), notice: 'Job Successfully marked Complete.'
  end

  member_action :Pending, method: :put do
    assigned_job = AssignedJob.find(params[:id])
    assigned_job.update(job_status: 'Pending')   
    redirect_to admin_assigned_job_path(assigned_job), notice: 'Job Successfully marked Pending.'
  end

  index do
    selectable_column
    column 'User', :user
    column 'Job', :job
    column 'Net Payment', :payment
    column 'Total Hours Worked', :total_hours
    column :payment_status
    column :job_status
    actions
  end

  form do |f|
  	if f.object.id.nil?
      f.inputs 'User Job Map' do
        f.input :user, as: :select, collection: User.all.map(&:email)
        f.input :job, as: :select, collection: Job.all.map(&:title)
      end
    end
    f.inputs 'Assigned Job Details' do
    	f.input :payment, label: 'Net Payment'
      f.input :total_hours, label: 'Total Hours Worked'
    	f.input :payment_status, as: :select, collection: ['Pending', 'Complete']
      f.input :job_status, as: :select, collection: ['Pending', 'Complete']
      f.input :pay_slip, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :job
      row 'Net Payment' do
        assigned_job.payment
      end
      row 'Total Hours Worked' do
        assigned_job.total_hours
      end
      row :payment_status
      row :job_status
      row :pay_slip do
        if assigned_job.pay_slip.exists?
          link_to assigned_job.pay_slip_file_name, assigned_job.pay_slip.url(:original, false), target: :_blank
        else
          'No Pay Slip Attached Yet'
        end
      end
    end
    active_admin_comments
  end



  filter :user, as: :select, collection: proc { AssignedJob.select(:user_id).distinct.map(&:user) }
  filter :job, as: :select, collection: proc { AssignedJob.select(:job_id).distinct.map(&:job) }
  filter :job_status, as: :select, collection: ['Pending', 'Complete']
  filter :payment_status, as: :select, collection: ['Pending', 'Complete']


end
