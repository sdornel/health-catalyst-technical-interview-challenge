class Partner < ApplicationRecord
    has_many :customers
    has_many :patients, through: :customers
    # has_many :exports
    
    def self.to_csv(partner_id, patients)
        attributes = %w{ id date_of_birth given_name family_name phone_number sex external_id customer_external_id }

        CSV.generate(headers: true) do |csv|
            csv << attributes
            patients.each do |patient|
                csv << attributes.map do |attr| 
                    patient.send(attr) 
                end
            end
            start = Time.now
            Export.create(partner_id: partner_id, export_status: "Complete", number_records: patients.length, created_at: start, export_duration_in_mins: ((Time.now - start)/60), export_ended: DateTime.now )
            rescue
                Export.create(export_status: "Failed")
        end
    end
end