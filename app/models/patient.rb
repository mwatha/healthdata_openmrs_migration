class Patient < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'patient'


end
