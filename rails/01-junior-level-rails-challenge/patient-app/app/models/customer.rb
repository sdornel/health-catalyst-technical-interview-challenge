class Customer < ApplicationRecord
    has_many :patients
    belongs_to :partner
end
