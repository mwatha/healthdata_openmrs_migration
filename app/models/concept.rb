class Concept < ActiveRecord::Base
  establish_connection "openmrs_#{Rails.env}"
  self.table_name = 'concept'

  def self.create(name)
    return if name == ' -'
    return if name.blank?
    concept = Concept.new()
    concept.datatype_id = 2
    concept.class_id = 1
    concept.is_set = 0
    concept.creator = 1
    concept.date_created = Time.now()
    concept.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    concept.save

    concept_name = ConceptName.new()
    concept_name.concept_id = concept.concept_id
    concept_name.locale = 'en'
    concept_name.name = name
    concept_name.creator = 1
    concept_name.date_created = Time.now()
    concept_name.concept_name_type = 'FULLY_SPECIFIED'
    concept_name.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    concept_name.save

    puts "Created new concept #{concept_name.name} ...."
  end

end
