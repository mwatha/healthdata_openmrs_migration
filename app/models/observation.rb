class Observation < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'obs'

end
