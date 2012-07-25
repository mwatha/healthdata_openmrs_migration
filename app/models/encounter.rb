class Encounter < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'encounter'


end
