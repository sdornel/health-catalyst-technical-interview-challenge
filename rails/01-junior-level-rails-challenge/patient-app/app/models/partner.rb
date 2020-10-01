require 'csv'

class Partner < ApplicationRecord
    has_many :customers
    has_many :patients, through: :customers
    
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
            export = Export.create(partner_id: partner_id, export_status: "Complete", number_records: patients.length, created_at: start, export_duration_in_mins: ((Time.now - start)/60), export_ended: DateTime.now )
            if export.id == nil || export.number_records == nil || export.created_at == nil || export.export_ended == nil || export.export_duration_in_mins == nil || export.partner_id == nil
                Export.last.update(export_status: "Failed")
            end
        end
    end
end