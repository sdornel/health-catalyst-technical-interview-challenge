require 'csv'

class Customer < ApplicationRecord
    has_many :patients
    belongs_to :partner

    def find_partner
        Partner.find_by(id: Customer.first.partner_id)
    end

    def self.to_csv(customer_id, patients)
        attributes = %w{ id date_of_birth given_name family_name phone_number sex external_id customer_external_id }

        CSV.generate(headers: true) do |csv|
            csv << attributes
            patients.each do |patient|
                csv << attributes.map do |attr| 
                    patient.send(attr) 
                end
            end
            start = Time.now
            Export.create(customer_id: customer_id, export_status: "Complete", number_records: patients.length, created_at: start, export_duration_in_mins: ((Time.now - start)/60), export_ended: DateTime.now )
            if export.id == nil || export.number_records == nil || export.created_at == nil || export.export_ended == nil || export.export_duration_in_mins == nil || export.customer_id == nil
                Export.last.update(export_status: "Failed (check other columns)")
            end
        end
    end
end