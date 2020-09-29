class Partner < ApplicationRecord
    has_many :customers
    has_many :patients, through: :customers
    # has_many :exports
    
    # TODO: create method to sort partners by id
end