class CreateRequestedJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :requested_jobs do |t|
      t.integer :user_id
      t.integer :job_id
      t.string :status

      t.timestamps
    end
  end
end
