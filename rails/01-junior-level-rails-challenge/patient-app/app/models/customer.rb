class Customer < ApplicationRecord
#     # self.primary_key = 'customer_external_id'
    
    has_many :patients
    belongs_to :partner

end
