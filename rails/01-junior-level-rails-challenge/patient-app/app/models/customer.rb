class Customer < ApplicationRecord
    has_many :patients
    # has_many :exports
    belongs_to :partner

    # TODO: create method to sort customers by id

    def find_partner
        Partner.find_by(id: Customer.first.partner_id)
    end

    # def self.to_csv(id)
    #     attributes = %w{ id date_of_birth given_name family_name phone_number sex external_id customer_external_id }

    #     CSV.generate(headers: true) do |csv|
    #         # CSV.read(Rails.root.join('db', 'seed_files', 'patients.csv')).length - 1 # num records in export
    #         csv << attributes
    #         # byebug
    #         Customer.find_by(id: id).patients.each do |patient|
    #         # Patient.all.each do |patient|
    #         # byebug
    #             csv << attributes.map do |attr| 
    #                 # if attr != "customer_id"
    #                     patient.send(attr) 
    #                 # end
    #             end
    #         end
    #     end
    #     start = Time.now
    #     Export.create(export_status: "Complete", number_records: Patient.all.length, created_at: start, export_duration_in_mins: ((Time.now - start)/60), export_ended: DateTime.now )
    #     ex = Export.create(export_status: "Complete", number_records: Patient.all.length, created_at: start, export_duration_in_mins: ((Time.now - start)/60), export_ended: DateTime.now )
    #     puts ex.id
    #     # byebug
    #     rescue
    #         Export.create(export_status: "Failed")
    # end
end