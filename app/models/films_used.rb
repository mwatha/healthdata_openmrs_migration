class FilmsUsed < ActiveRecord::Base
  self.table_name = 'FilmsUsed'

  belongs_to :radiology_study, :class_name => "RadiologyStudy", 
    :foreign_key => :study_number
end
