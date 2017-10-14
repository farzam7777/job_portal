ActiveAdmin.register AssignedJob do
	permit_params :user_id, :job_id, :payment, :total_hours, :job_status, :payment_status

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
    end
    f.actions
  end

  filter :user, as: :select, collection: proc { AssignedJob.select(:user_id).distinct.map(&:user) }
  filter :job, as: :select, collection: proc { AssignedJob.select(:job_id).distinct.map(&:job) }
  filter :job_status, as: :select, collection: ['Pending', 'Complete']
  filter :payment_status, as: :select, collection: ['Pending', 'Complete']


end
