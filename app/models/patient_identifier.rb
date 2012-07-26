class PatientIdentifier < ActiveRecord::Base
  establish_connection "openmrs_#{Rails.env}"
  self.table_name = 'patient_identifier'

  belongs_to :patient, :class_name => "Patient", :foreign_key => :patient_id, :conditions => {:voided => 0}

end
