class EncounterType < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'encounter_type'

end
