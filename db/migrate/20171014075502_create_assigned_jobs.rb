class CreateAssignedJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :assigned_jobs do |t|
      t.integer :user_id
      t.integer :job_id
      t.float :payment
      t.float :total_hours
      t.string :job_status
      t.string :payment_status

      t.timestamps
    end
  end
end
