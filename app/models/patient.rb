class Patient < ActiveRecord::Base
    establish_connection "openmrs_#{Rails.env}"
    self.table_name = 'patient'

    has_many :patient_identifiers, :foreign_key => :patient_id, 
      :dependent => :destroy, :conditions => {:voided => 0}

end
