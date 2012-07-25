class PersonAttributeType < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'person_attribute_type'


end
