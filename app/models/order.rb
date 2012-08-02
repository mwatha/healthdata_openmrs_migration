class Order < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'orders'

end
