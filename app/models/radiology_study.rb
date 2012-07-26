class RadiologyStudy < ActiveRecord::Base
  self.table_name = 'RadiologyStudy'

   has_many :film_used, :class_name => "FilmsUsed",:foreign_key => :study_number

end
