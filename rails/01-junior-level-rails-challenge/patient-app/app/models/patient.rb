require 'csv'

class Patient < ApplicationRecord
    belongs_to :customer

    def patient_with_details
        byebug
        # Patient.select()
    end

    def self.to_csv
        attributes = %w{ id date_of_birth given_name family_name phone_number sex external_id customer_external_id }

        # t.date :date_of_birth
        # t.string :given_name
        # t.string :family_name
        # t.string :phone_number
        # t.string :sex
        # t.string :external_id
        # t.integer :customer_id

        # "date_of_birth","given_name","family_name","phone_number","sex","external_id","customer_external_id"
    
        CSV.generate(headers: true) do |csv|
            csv << attributes
            # byebug
    
          Patient.all.each do |patient|
            # byebug
            csv << attributes.map do |attr| 
            # byebug
                # if attr != "customer_id"
                    patient.send(attr) 
                # end
            end
          end
        end
    end
end
