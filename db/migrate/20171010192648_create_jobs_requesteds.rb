class CreateJobsRequesteds < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs_requesteds do |t|
      t.integer :user_id
      t.integer :job_id
      t.string :status

      t.timestamps
    end
  end
end
