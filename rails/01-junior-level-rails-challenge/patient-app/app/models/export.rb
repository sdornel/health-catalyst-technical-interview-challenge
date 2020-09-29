class Export < ApplicationRecord
    belongs_to :partner, optional: true 
    belongs_to :customer, optional: true 
    
end