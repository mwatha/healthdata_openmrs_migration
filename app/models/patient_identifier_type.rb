class PatientIdentifierType < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'patient_identifier_type'


end
