class Location < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'location'

end
