class Customer < ApplicationRecord
    has_many :patients
    belongs_to :partner

    # TODO: create methods to link customers with their partners
end