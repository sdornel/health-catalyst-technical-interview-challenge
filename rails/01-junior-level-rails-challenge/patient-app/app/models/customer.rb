class Customer < ApplicationRecord
    has_many :patients
    belongs_to :partner

    # TODO: create method to sort customers by id

    def find_partner
        Partner.find_by(id: Customer.first.partner_id)
    end
end