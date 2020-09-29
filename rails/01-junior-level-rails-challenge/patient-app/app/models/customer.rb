class Customer < ApplicationRecord
    has_many :patients
    # has_many :exports
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
            rescue
                Export.create(export_status: "Failed")
        end
    end
end