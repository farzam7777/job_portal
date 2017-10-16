ActiveAdmin.register RequestedJob do
  permit_params :user_id, :job_id, :status

  scope :admin_report_request_pending_jobs
  
  action_item :Approve, only: :show do 
    link_to "Approve", Approve_admin_requested_job_path(requested_job), method: :put if requested_job.status == 'Not Reviewed'
  end
  
  action_item :Deny, only: :show do 
    link_to "Reject", Deny_admin_requested_job_path(requested_job), method: :put if requested_job.status == 'Not Reviewed'
  end
  
  member_action :Approve, method: :put do
    requested_job = RequestedJob.find(params[:id])
    requested_job.update(status: 'Approved')
    assigned_job = AssignedJob.new
    
    if requested_job.job.status == "Hourly"
      assigned_job = AssignedJob.create(user_id: requested_job.user.id, job_id: requested_job.job.id, total_hours: 0, job_status: 'Pending', payment_status: 'Pending', payment: 0)
    else
      assigned_job = AssignedJob.create(user_id: requested_job.user.id, job_id: requested_job.job.id, total_hours: 0, job_status: 'Pending', payment_status: 'Pending', payment: requested_job.job.payment)
    end
    
    if assigned_job.save
      redirect_to admin_assigned_job_path(assigned_job)
    else 
      redirect_to admin_requested_job_path(requested_job), alert: 'Some Problem Occured.'
    end
  end
  
  member_action :Deny, method: :put do
    requested_job = RequestedJob.find(params[:id])
    requested_job.update(status: 'Rejected')
    redirect_to admin_requested_jobs_path, notice: 'Request is successfully removed from Requested Jobs.'
  end

  form do |f|
    f.inputs 'Requested Jobs Details' do
      f.input :status, as: :select, collection: ['Approved', 'Rejected', 'Not Reviewed']
    end
    if f.object.id.nil?
      f.inputs 'User Job Map' do
        f.input :user, as: :select, collection: User.all.map(&:email)
        f.input :job, as: :select, collection: Job.all.map(&:title)
      end
    end
    f.actions
  end

  filter :user_id, as: :select, collection: proc { RequestedJob.select(:user_id).distinct.map(&:user) }
  filter :job, as: :select, collection: proc { RequestedJob.select(:job_id).distinct.map(&:job) }
  filter :status, as: :select, collection: ['Approved', 'Rejected', 'Not Reviewed']
  
  
end
