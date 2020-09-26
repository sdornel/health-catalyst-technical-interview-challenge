class Partner < ApplicationRecord
    has_many :customers
    has_many :patients, through: :customers
end
# has_many :users, through: :adoptions