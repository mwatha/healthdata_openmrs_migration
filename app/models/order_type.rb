class OrderType < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'order_type'

end
