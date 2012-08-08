  require 'lib/bantu_soundex'

  Examination_encounter = EncounterType.find_by_name('EXAMINATION')
  Film_size_encounter = EncounterType.find_by_name('Film size')
  Notes_encounter = EncounterType.find_by_name('NOTES')
  Investigation_encounter = EncounterType.find_by_name('Investigation')
  Exam_num_concept = ConceptName.find_by_name('Exam num')
  Film_size_concept = ConceptName.find_by_name('Size')
  Bad_concept = ConceptName.find_by_name('Bad')
  Good_concept = ConceptName.find_by_name('Good')
  Investigation_type_concept = ConceptName.find_by_name('Investigation type')
  Ultrasound_concept = ConceptName.find_by_name('Ultrasound')
  Xray_concept = ConceptName.find_by_name('Xray')
  Other_concept = ConceptName.find_by_name('Other')
  Order_type = OrderType.find_by_name('Radiology Study')
  Pay_category = ConceptName.find_by_name('Pay category')
  Yes_concept = ConceptName.find_by_name('Yes')
  No_concept = ConceptName.find_by_name('No')
  Receipt_number_concept = ConceptName.find_by_name('Receipt number')
  Amount_concept = ConceptName.find_by_name('Amount')
  Clinical_notes_concept = ConceptName.find_by_name('Clinical notes construct')
  Location_id = Location.find_by_name('Kamuzu Central Hospital').id

  def migrated_users
    users = Clinician.all(:limit => 700)
    count = users.length
    migrated_count = 0
    migration_start_time = Time.now().strftime('%Y-%m-%d %H:%M:%S')

    puts "Migrating #{count} users' record(s) ........."  
    sleep(3)

    (users || []).each do |user|
      password = user.try(:Clinician_ID) rescue nil
      next if password.blank?
      given_name = user.try(:Clinician_F_Name).capitalize rescue nil
      family_name = user.try(:Clinician_L_Name).capitalize rescue nil
      username = given_name[0..2].downcase + family_name[0..2].downcase
      valid_username = Users.where(:'username' => username).first.blank? != []
      unless valid_username
        username = "#{username}#{migrated_count}"  
      end

      person = new_person
      create_person_name(1, person.id,given_name,family_name)
      create_users(person.id, username, password)
      
      puts "Migrated #{(migrated_count+=1)} of #{count} user(s) <<<"
    end

    puts <<EOF


    Started at #{migration_start_time} - finished at #{Time.now().strftime('%Y-%m-%d %H:%M:%S' )} .....
EOF

  end

  def log_error(patient_id,message)
    `echo "#{patient_id}: #{message}" >> #{Rails.root.join('log','migration_error.txt')}`
  end

  def migrated_patient_demographics
    patients = MasterPatientRecord.all #(:limit => 1000000)
    #where(:'Pat_ID' => 905891) #,
    count = patients.length
    migrated_count = 0
    migration_start_time = Time.now().strftime('%Y-%m-%d %H:%M:%S')

    puts <<EOF




EOF

    puts "Migrating #{count} patients' record(s) ........."  
    sleep(3)

    (patients || []).each do |pat|
      given_name = pat.try(:First_Name).capitalize rescue nil
      family_name = pat.try(:Last_Name).capitalize rescue nil
      gender = pat.try(:Sex)
      day_of_birth = pat.try(:Day_Of_Birth)
      month_of_birth = pat.try(:Month_Of_Birth)
      year_of_birth = pat.try(:Year_Of_Birth)

      birthdate_estimated = birthdate_calculations(year_of_birth, month_of_birth, day_of_birth)
      if birthdate_estimated.blank?
        log_error(pat.Pat_ID,"Invalid birthdate: #{year_of_birth}, #{month_of_birth}, #{day_of_birth}")
        next
      end

      birthdate = birthdate_estimated[1]
      estimated = birthdate_estimated[0]

      date_created = pat.try(:Date_Reg).to_date.to_time.strftime('%Y-%m-%d %H:%M:%S') rescue Time.now().strftime('%Y-%m-%d %H:%M:%S')
      creator = get_creator(pat.try(:Reg_By))

      person = new_person(creator,birthdate, estimated, gender, date_created)
      patient = new_patient(creator,person.id,date_created)

      if given_name and family_name
        create_person_name(creator, person.id, given_name,family_name)
      end

      county_district = pat.try(:Birth_TA).split('/')[1] rescue nil #country_district
      address2 = pat.try(:Birth_TA).split('/')[0] rescue nil #address2
      state_province = pat.try(:Address).split('/')[0] rescue nil #state_province
      city_village = pat.try(:Address).split('/')[1] rescue nil #city_village

      national_id = get_second_generation_id(pat.try(:Site_ID),pat.try(:Pat_ID))
      legacy_patient_id = pat.try(:Legacy_Pat_Num)

      create_identifier(creator, patient.id, national_id,'National id') unless national_id.blank?
      create_identifier(creator, patient.id, legacy_patient_id,'Old Identification Number') unless legacy_patient_id.blank?

      create_address(creator, person.id, address2, city_village, state_province, county_district, date_created)

      puts "Migrated #{(migrated_count+=1)} of #{count} patient(s) <<<"
    end
    
    puts <<EOF


    Started at #{migration_start_time} - finished at #{Time.now().strftime('%Y-%m-%d %H:%M:%S' )} .....
EOF
  
  end

  def get_second_generation_id(site_id,patient_id)
    if not site_id.blank? and not patient_id.blank?
      return (site_id.to_i.to_s.ljust(9,"0")[0..(-patient_id.to_i.to_s.length - 1)]) + patient_id.to_i.to_s
    end
  end

  def get_creator(clinician_id)
    return 1 if clinician_id.blank?
    Users.where(:'secret_answer' => clinician_id).first.try(:user_id) || 1
  end

  def get_openmrs_patient(identifier)
    PatientIdentifier.where('identifier = (?) OR identifier = (?)',
      identifier.gsub('-',''),identifier).last.patient rescue nil
  end

  def birthdate_calculations(birth_year, birth_month, day_of_birth)
    estimate = false
    birthdate = nil                                                        

    if birth_month == "??" and day_of_birth != '??'
      birthdate = "#{birth_year}-07-#{day_of_birth}".to_date                                   
      estimate = true                                                        
    elsif day_of_birth == "??" and birth_month != "??"
      birthdate = "#{birth_year}-#{birth_month}-15".to_date                                   
      estimate = true                                                        
    elsif day_of_birth == "??" and birth_month == "??"
      birthdate = "#{birth_year}-07-01".to_date                                   
      estimate = true
    else                                                        
      birthdate = "#{birth_year}-#{birth_month}-#{day_of_birth}".to_date                                   
    end rescue nil                                                                       
                  
    return [] if birthdate.blank?              
                                                                                
    return [estimate,birthdate]
  end

  def new_person(creator = 1, birthdate = nil, birthdate_estimated = 0, gender = nil, date_created = Time.now())
    person = Person.new()
    person.creator = creator
    person.date_created = date_created
    person.gender = gender.upcase unless gender.blank?
    person.birthdate = birthdate unless birthdate.blank?
    person.birthdate_estimated = birthdate_estimated 
    person.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    person.save
    return person
  end

  def new_patient(creator, person_id, date_created)
    person = Patient.new()
    person.creator = creator || 1
    person.patient_id = person_id
    person.date_created = date_created
    person.save
    return person
  end

  def create_person_name(creator, person_id, given_name, family_name)
    person_name = PersonName.new()
    person_name.given_name = given_name
    person_name.family_name = family_name
    person_name.person_id = person_id
    person_name.date_created = Time.now()
    person_name.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    person_name.creator = creator
    person_name.save

    create_person_name_code(person_name.id,given_name,family_name)
  end

  def create_person_name_code(person_name_id, given_name, family_name)
    person_name = PersonNameCode.new()
    person_name.given_name_code = given_name.soundex
    person_name.family_name_code = family_name.soundex
    person_name.person_name_id = person_name_id
    person_name.save
  end

  def create_users(person_id, username, password)
    u = Users.new()
    u.username = username
    u.creator = 1
    u.date_created = Time.now()
    u.date_changed = Time.now()
    u.person_id = person_id
    u.password = Digest::SHA1.hexdigest(password)
    u.secret_answer = password
    u.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    u.save
  end

  def create_identifier(creator, patient_id, identifier, identifier_type)
    type = PatientIdentifierType.where(:'name' => identifier_type).first
    i = PatientIdentifier.new()
    i.creator = creator
    i.identifier_type = type.try(:patient_identifier_type_id)
    i.identifier = identifier
    i.location_id = Location_id
    i.date_created = Time.now()
    i.patient_id = patient_id
    i.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    i.save
  end

  def create_address(creator, person_id, address2, city_village, state_province, county_district, date_created)
    a = PersonAddress.new()
    a.creator = creator
    a.person_id = person_id
    a.address2 = address2 unless address2.blank?
    a.city_village = city_village unless city_village.blank?
    a.state_province = state_province unless state_province.blank?
    a.county_district = county_district unless county_district.blank?
    a.date_created = date_created
    a.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    a.save
  end
 
  def migrated_radiology_study_data
    records = RadiologyStudy.all #where('Patient_Identifier <> (?)','10-1905-891').limit(10000) 
    count = records.length
    migrated_count = 0

    puts <<EOF




EOF

    puts "Migrating #{count} record(s) ........."  
    sleep(3)

    (records || []).each do |record|
      patient = get_openmrs_patient(record.try(:Patient_Identifier))
      next if patient.blank?
      study_number = record.try(:Study_Number)
      study_datetime = (record.try(:Study_Date) + " " + record.try(:Study_Time))
      study_datetime = study_datetime.to_time.strftime('%Y-%m-%d %H:%M:%S') rescue nil
      study_datetime = Time.now().strftime('%Y-%m-%d %H:%M:%S') if study_datetime.blank?
      clerk = get_creator(record.try(:Clerk))
      creator = get_creator(record.try(:Examiner))
      exam_date = record.try(:Exam_Date).to_date rescue nil
      notes = record.try(:Note)
      referred_by = record.try(:Referred_By)
      study_type = record.try(:Study_Type) || 'Other' 

      paying = record.try(:Paying) || 'N'
      receipt_num = record.try(:ReceiptNum)
      amount = record.try(:KwachaAmount)


      if study_type.upcase.match("U/S")
        study_type = Ultrasound_concept.concept_id
      elsif study_type.upcase.match("XRAY")
        study_type = Xray_concept.concept_id
      else
        study_type = Other_concept.concept_id
      end

      examination = Encounter.new()
      examination.creator = creator
      examination.encounter_type = Examination_encounter.id
      examination.patient_id = patient.id
      examination.creator = clerk
      examination.location_id = Location_id
      examination.provider_id = creator
      examination.encounter_datetime = study_datetime
      examination.date_created = Time.now()
      examination.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      examination.save

      order = Order.new()
      order.accession_number = ('R' + (study_number.to_i.to_s.rjust(8,'0')))
      order.encounter_id = examination.id
      order.order_type_id = Order_type.id
      order.concept_id = study_type
      order.discontinued = 0 
      order.orderer = clerk
      order.creator = clerk
      order.date_created = examination.encounter_datetime
      order.voided = 0
      order.patient_id = patient.id
      order.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      order.save

      paying = record.try(:Paying) || 'N'
      receipt_num = record.try(:ReceiptNum)
      amount = record.try(:KwachaAmount)
      encounter = radiology_encounter('Investigation',creator,patient,study_datetime)
      create_investigation_obs(encounter,amount,receipt_num,paying,order)

      notes = record.try(:Note)  
      notes_encounter = radiology_encounter('Notes',creator,patient,study_datetime) unless notes.blank?
      create_notes_obs(notes_encounter,notes,order) unless notes_encounter.blank?

      films_used = FilmsUsed.where(:'Study_Number' => study_number) 
      films_used_encounter = radiology_encounter('Film Size',creator,patient,study_datetime) unless films_used.blank?

      (films_used || []).each do |film|
        film_size = film.try(:FilmSize)
        films_used = film.try(:FilmsUsed).to_i rescue 1
        film_wasted = film.try(:FilmsWasted).to_i rescue 0
        date_used = film.try(:DateUsed).to_date rescue nil

        create_films_used_obs(films_used_encounter,order,film_size,films_used,film_wasted,date_used)
      end

      puts "Migrated #{(migrated_count+=1)} of #{count} Radiology Study record(s) <<<"
    end

  end

  def create_films_used_obs(encounter,order,film_size,films_used,film_wasted,date_used)
    #creating good films used obs
    (1.upto(films_used)).each do |number|
      obs = Observation.new()
      obs.person_id = encounter.patient_id
      obs.concept_id = Good_concept.id
      obs.value_text = film_size
      obs.creator = encounter.creator
      obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      obs.encounter_id = encounter.id
      obs.order_id = order.id
      obs.obs_datetime = date_used.to_date.strftime('%Y-%m-%d 00:00:00') rescue encounter.date_created
      obs.date_created = Time.now()
      obs.creator = encounter.creator
      obs.save
    end  

    #creating bad films used obs
    (1.upto(film_wasted)).each do |number|
      obs = Observation.new()
      obs.person_id = encounter.patient_id
      obs.concept_id = Bad_concept.id
      obs.value_text = film_size
      obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      obs.encounter_id = encounter.id
      obs.order_id = order.id
      obs.obs_datetime = date_used.to_date.strftime('%Y-%m-%d 00:00:00') rescue encounter.date_created
      obs.date_created = Time.now()
      obs.creator = encounter.creator
      obs.save
    end  
  end
  
   
  def radiology_encounter(encounter_type,creator,patient,encounter_datetime) 
    type = Investigation_encounter if encounter_type == 'Investigation'
    type = Film_size_encounter if encounter_type == 'Film Size'
    type = Notes_encounter if encounter_type == 'Notes'

    e = Encounter.new()
    e.creator = creator
    e.encounter_type = type.id
    e.patient_id = patient.id
    e.provider_id = creator
    e.location_id = Location_id
    e.encounter_datetime = encounter_datetime
    e.date_created = Time.now()
    e.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    e.save
    return e
  end

  def create_investigation_obs(encounter,amount,receipt_num,paying,order)
    unless amount.blank?
      obs = Observation.new()
      obs.person_id = encounter.patient_id
      obs.concept_id = Amount_concept.id
      obs.creator = encounter.creator
      obs.value_numeric = amount.to_f
      obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      obs.encounter_id = encounter.id
      obs.order_id = order.id
      obs.obs_datetime = encounter.date_created
      obs.date_created = Time.now()
      obs.creator = encounter.creator
      obs.save
    end 

    unless receipt_num.blank?
      obs = Observation.new()
      obs.person_id = encounter.patient_id
      obs.concept_id = Receipt_number_concept.id
      obs.value_text = receipt_num
      obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      obs.encounter_id = encounter.id
      obs.order_id = order.id
      obs.obs_datetime = encounter.date_created
      obs.date_created = Time.now()
      obs.creator = encounter.creator
      obs.save
    end

    unless paying.blank?
      obs = Observation.new()
      obs.person_id = encounter.patient_id
      obs.concept_id = Pay_category.id
      obs.value_coded = Yes_concept.id if paying == 'Y'
      obs.value_coded = No_concept.id if paying == 'N'
      obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      obs.encounter_id = encounter.id
      obs.order_id = order.id
      obs.obs_datetime = encounter.date_created
      obs.date_created = Time.now()
      obs.creator = encounter.creator
      obs.save
    end
  end

  def create_notes_obs(encounter,notes,order) 
    obs = Observation.new()
    obs.person_id = encounter.patient_id
    obs.concept_id = Clinical_notes_concept.id
    obs.value_text = notes
    obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    obs.encounter_id = encounter.id
    obs.order_id = order.id
    obs.creator = encounter.creator
    obs.obs_datetime = encounter.date_created
    obs.date_created = Time.now()
    obs.save
  end


  migrated_users
  migrated_patient_demographics
  #migrated_radiology_study_data
