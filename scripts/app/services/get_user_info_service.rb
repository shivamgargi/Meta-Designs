class GetUserInfoService
  require 'csv'

  def self.run(file)
    errors = []
    csv_text = File.read(file)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      begin
        data = row.to_hash
        User.create!(first_name: data["FIRST_NAME"],last_name: data["LAST_NAME"],email_id: data["EMAIL_ID"])
      rescue Exception => e
        @error = errors.push([error: e.message, email: data["EMAIL_ID"]])
      end
    end
    return @error
  end
end
