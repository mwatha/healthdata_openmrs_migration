class ConceptName < ActiveRecord::Base
  establish_connection "openmrs_#{Rails.env}"
  self.table_name = 'concept_name'

end
