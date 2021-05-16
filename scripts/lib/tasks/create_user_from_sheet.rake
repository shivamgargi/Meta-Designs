task :create_user_from_sheet => :environment do
	require 'csv'
	csv_text = File.read('TaskSampleSheet.csv')
	csv = CSV.parse(csv_text, :headers => true)
	csv.each do |row|
		data = row.to_hash
	  User.create!(first_name: data["FIRST_NAME"],last_name: data["LAST_NAME"],email_id: data["EMAIL_ID"])
	end
end
