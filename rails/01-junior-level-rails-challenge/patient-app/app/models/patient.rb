require 'csv'

class Patient < ApplicationRecord
    belongs_to :customer
    # has_many :exports

    def self.to_csv
        attributes = %w{ id date_of_birth given_name family_name phone_number sex external_id customer_external_id }

        CSV.generate(headers: true) do |csv|
    #         # CSV.read(Rails.root.join('db', 'seed_files', 'patients.csv')).length - 1 # num records in export
            csv << attributes

            Patient.all.each do |patient|
    #         # byebug
                csv << attributes.map do |attr| 
    #             # byebug
    #                 # if attr != "customer_id"
                        patient.send(attr) 
    #                 # end
                end
            end
        end
    #     start = Time.now
    #     Export.create(export_status: "Complete", number_records: Patient.all.length, created_at: start, export_duration_in_mins: ((Time.now - start)/60), export_ended: DateTime.now )
    #     rescue
    #         Export.create(export_status: "Failed")
    end

end


      
# t.string :export_status
      
# t.integer :number_records
# t.timestamps # created at
# t.date :export_ended
# t.integer :export_duration