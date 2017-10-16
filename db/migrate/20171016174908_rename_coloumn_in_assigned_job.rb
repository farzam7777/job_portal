class RenameColoumnInAssignedJob < ActiveRecord::Migration[5.1]
  def change
  	rename_column :assigned_jobs, :job_id, :requested_job_id
  end
end
