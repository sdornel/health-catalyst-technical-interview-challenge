class Export < ApplicationRecord
    belongs_to :partner, optional: true # allow for nil values
    belongs_to :customer, optional: true 
    
end