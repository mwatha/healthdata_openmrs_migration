class PersonNameCode < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'person_name_code'

end
