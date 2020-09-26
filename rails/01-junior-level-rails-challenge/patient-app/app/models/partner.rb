class Partner < ApplicationRecord
    has_many :customers
    has_many :patients, through: :customers
end