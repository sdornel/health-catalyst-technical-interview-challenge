class Customer < ApplicationRecord
    has_many :patients
    belongs_to :partner

    # TODO: create methods to link customers with their partners
    def find_partner
        Partner.find_by(id: Customer.first.partner_id)
    end
end