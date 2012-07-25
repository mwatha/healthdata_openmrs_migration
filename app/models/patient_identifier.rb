class PatientIdentifier < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'patient_identifier'


end
