ActiveAdmin.register Clock do
	permit_params :clock_in, :clock_out, :job_id

	form do |f|
    f.inputs 'Job Details' do
    	f.input :job
      f.input :clock_in, as: :time_picker
      f.input :clock_out, as: :time_picker 
    end
    f.actions
  end

end
