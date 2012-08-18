  require 'lib/bantu_soundex'


  Radiology_examination = EncounterType.find_by_name('RADIOLOGY EXAMINATION')
  Radiology_order = ConceptName.find_by_name('Radiology test')
  Ultrasound_concept = ConceptName.find_by_name('Ultrasound')
  Xray_concept = ConceptName.find_by_name('Xray')
  Films_encounter = EncounterType.find_by_name('Film')
  Notes_encounter = EncounterType.find_by_name('Notes')
  
  Film_size_concept = ConceptName.find_by_name('Film size')
  Wasted_concept = ConceptName.find_by_name('Wasted film')
  Good_concept = ConceptName.find_by_name('Good film')
  Size_13x18 = ConceptName.find_by_name('13 x 18 cm')
  Size_18x24 = ConceptName.find_by_name('18 x 24 cm')
  Size_18x43 = ConceptName.find_by_name('18 x 43 cm')
  Size_24x30 = ConceptName.find_by_name('24 x 30 cm')
  Size_30x40 = ConceptName.find_by_name('30 x 40 cm')
  Size_35x35 = ConceptName.find_by_name('35 x 35 cm')
  Size_35x48 = ConceptName.find_by_name('35 x 48 cm')

  Other_concept = ConceptName.find_by_name('Other')

  Pay_category = ConceptName.find_by_name('Paying')
  Amount_concept = ConceptName.find_by_name('Payment amount')
  Payment_type_concept = ConceptName.find_by_name('Payment type')
  Cash_concept = ConceptName.find_by_name('Cash')
  Receipt_number_concept = ConceptName.find_by_name('Receipt number')
  Yes_concept = ConceptName.find_by_name('Yes')
  No_concept = ConceptName.find_by_name('No')

  Referred_from_concept = ConceptName.find_by_name('Referred from')
  Clinical_notes_concept = ConceptName.find_by_name('Findings')

  Location_id = Location.find_by_name('Kamuzu Central Hospital').id


  #........ Radiology concepts


  Abdomen = ConceptName.find_by_name('Abdomen') # Abdomen
  Chest = ConceptName.find_by_name('Chest') #Chest
  #U/S - Colour Doppler Arteries,U/S - Colour Doppler Veins
  PeritheralArterialandVenousDuplex = ConceptName.find_by_name('Peritheral Arterial and Venous Duplex') 
  Echocardiography = ConceptName.find_by_name('Echocardiography') #U/S - Echocardiography
  NeonatalBrain = ConceptName.find_by_name('Neonatal Brain') #Head
  ThyroidandParathyroidGlands = ConceptName.find_by_name('Thyroid and Parathyroid Glands') #U/S - Neck
  Obstetrics = ConceptName.find_by_name('Obstetrics, Fetal') #U/S - Obstetrics
  Pelvis = ConceptName.find_by_name('Female Pelvis, Gynaecology') #U/S - Pelvis
  PowerDoppler = ConceptName.find_by_name('Peritheral Arterial and Venous Duplex') #U/S - Power Doppler
  SmallPart = ConceptName.find_by_name('Prostate Gland, Scrotum and Penis') #U/S - Small part

  #----------- Thorax = ConceptName.find_by_name('Thorax') #U/S - Thorax
  Thorax = ConceptName.find_by_name('Unknown') #U/S - Thorax

  Cervical = ConceptName.find_by_name('Cervical') #Xray - C-spine .. Note under concept spine
  ContrastGIstudy = ConceptName.find_by_name('Contrast GI studies') #Xray - Contrast GI study
  ContrastUTstudy = ConceptName.find_by_name('Contrast UT studies') #Xray - Contrast UT study
  FacialBones = ConceptName.find_by_name('Facial bones') #Xray - Facial bones Note it is under concept Skull
  HSG = ConceptName.find_by_name('Hystero,Salpingogram') #Xray - HSG
  Lumbar = ConceptName.find_by_name('Lumbar') #Xray - L-spine: Note its under Spine
  Thoracic = ConceptName.find_by_name('Thoracic') #Xray - T-spine


  LeftAnkleJoint = ConceptName.find_by_name('Left Ankle joint') #Left Ankle joint: under Lower Limb
  LeftElbow = ConceptName.find_by_name('Left elbow joint') #Xray - Left Elbow: under Upper Limb
  LeftFemur = ConceptName.find_by_name('Left Femur') #Xray - Left Femur: under Lower Limb
  LeftFingers = ConceptName.find_by_name('Left Fingers') #Xray - Left Femur: under Upper Limb
  LeftFoot = ConceptName.find_by_name('Left Foot') #Xray - Left Foot: under Lower Limb
  LeftHand = ConceptName.find_by_name('Left Hand') #Xray - Left Hand: under Upper Limb
  LeftHipJoint = ConceptName.find_by_name('Left Hip joint') #Xray - Left Femur: under Lower Limb
  LeftHumerus = ConceptName.find_by_name('Left Humerus') #Xray - Left Humerus: under Upper Limb
  LeftKneeJoint = ConceptName.find_by_name('Left Knee joint') #Xray - Left Knee: under Lower Limb
  LeftForearm = ConceptName.find_by_name('Left Forearm') #Xray - Left Forearm under Upper Limb
  LeftShoulder = ConceptName.find_by_name('Left Shoulder') #Xray - Left Shoulder under Upper Limb
  LeftLeg = ConceptName.find_by_name('Left Leg') #Xray - Left Tibia/Fibula under Lower Limb
  LeftToes = ConceptName.find_by_name('Left Toes') #Xray - Left Toes under Lower Limb
  LeftWrist = ConceptName.find_by_name('Left Wrist joint') #Xray - Left Wrist under Upper Limb

  RightAnkleJoint = ConceptName.find_by_name('Right Ankle joint') #Right Ankle joint: under Lower Limb
  RightElbow = ConceptName.find_by_name('Right elbow joint') #Xray - Right Elbow: under Upper Limb
  RightFemur = ConceptName.find_by_name('Right Femur') #Xray - Right Femur: under Lower Limb
  RightFingers = ConceptName.find_by_name('Right Fingers') #Xray - Right Femur: under Upper Limb
  RightFoot = ConceptName.find_by_name('Right Foot') #Xray - Right Foot: under Lower Limb
  RightHand = ConceptName.find_by_name('Right Hand') #Xray - Right Hand: under Upper Limb
  RightHipJoint = ConceptName.find_by_name('Right Hip joint') #Xray - Right Femur: under Lower Limb
  RightHumerus = ConceptName.find_by_name('Right Humerus') #Xray - Right Humerus: under Upper Limb
  RightKneeJoint = ConceptName.find_by_name('Right Knee joint') #Xray - Right Knee: under Lower Limb
  RightForearm = ConceptName.find_by_name('Right Forearm') #Xray - Right Forearm under Upper Limb
  RightShoulder = ConceptName.find_by_name('Right Shoulder') #Xray - Right Shoulder under Upper Limb
  RightLeg = ConceptName.find_by_name('Right Leg') #Xray - Right Tibia/Fibula under Lower Limb
  RightToes = ConceptName.find_by_name('Right Toes') #Xray - Right Toes under Lower Limb
  RightWrist = ConceptName.find_by_name('Right Wrist joint') #Xray - right Wrist under Upper Limb

  Shoulder = ConceptName.find_by_name('Shoulder') #Xray - Right Shoulder under Upper Limb
  Skull = ConceptName.find_by_name('Skull') #Xray - Skull under Upper Limb
  UpperLimb = ConceptName.find_by_name('Upper Limb') #Xray - Upper limb
  LowerLimb = ConceptName.find_by_name('Lower Limb') #Xray - Lower limb
  #....................................








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
    #patients = MasterPatientRecord.all(:limit => 100)
    patients = MasterPatientRecord.where('Date_Reg = "09-AUG-2012" OR Date_Reg = "08-AUG-2012"')
    count = patients.length
    migrated_count = 0
    migration_start_time = Time.now().strftime('%Y-%m-%d %H:%M:%S')

    puts <<EOF




EOF

    puts "Migrating #{count} patients' record(s) ........."  
    sleep(3)

    (patients || []).each do |pat|

      national_id = get_second_generation_id(pat.try(:Site_ID),pat.try(:Pat_ID))
      legacy_patient_id = pat.try(:Legacy_Pat_Num)
      next if migrated?(national_id,legacy_patient_id)

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
      referred_from = record.try(:Referred_By)
      radiology_test_type = record.try(:Study_Type) || 'Other' 
      radiology_examination = radiology_test_type

      paying = record.try(:Paying) || 'N'
      receipt_num = record.try(:ReceiptNum)
      amount = record.try(:KwachaAmount)


      if radiology_test_type.upcase.match("U/S")
        radiology_test_type = Ultrasound_concept.concept_id
        radiology_examination = radiology_examination.delete("U/S -").strip.upcase
      elsif radiology_test_type.upcase.match("XRAY")
        radiology_test_type = Xray_concept.concept_id
        radiology_examination = radiology_examination.delete("Xray -").strip.upcase
      else
        radiology_test_type = Other_concept.concept_id
        radiology_examination = 'OTHER'
      end

      examination = Encounter.new()
      examination.creator = creator
      examination.encounter_type = Radiology_examination.id
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
      order.order_type_id = Radiology_order.id
      order.concept_id = radiology_test_type
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
      #encounter = radiology_encounter('Investigation',creator,patient,study_datetime)

      
      radiology_examination = radiology_old_concept(radiology_examination) 
      create_investigation_obs(examination,amount,receipt_num,paying,order,radiology_examination,referred_from)

      notes = record.try(:Note)  
      notes_encounter = radiology_encounter('Notes',creator,patient,study_datetime) unless notes.blank?
      create_notes_obs(notes_encounter,notes,order) unless notes_encounter.blank?

      films_used = FilmsUsed.where(:'Study_Number' => study_number) 
      films_used_encounter = radiology_encounter('Films',creator,patient,study_datetime) unless films_used.blank?

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

  def get_film_size(film_size)
    case film_size
      when '13x18'
        return Size_13x18 
      when '18x24'
        return Size_18x24 
      when '18x43'
        return Size_18x43 
      when '24x30'
        return Size_24x30 
      when '30x40'
        return Size_30x40 
      when '35x35'
        return Size_35x35
      when '35x43'
        return Size_35x48
  end

  def create_films_used_obs(encounter,order,film_size,films_used,film_wasted,date_used)
    films_obs = Observation.new()
    films_obs.person_id = encounter.patient_id
    films_obs.value_coded = get_film_size(film_size).id
    film_size.concept_id = Film_size_concept.id
    film_size.creator = encounter.creator
    film_size.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    film_size.encounter_id = encounter.id
    film_size.order_id = order.id
    film_size.obs_datetime = date_used.to_date.strftime('%Y-%m-%d 00:00:00') rescue encounter.date_created
    film_size.date_created = Time.now()
    film_size.creator = encounter.creator
    film_size.save

    obs = Observation.new()
    obs.person_id = encounter.patient_id
    obs.concept_id = Wasted_concept.id
    obs.value_numeric = film_wasted
    obs.obs_group_id = film_size.id
    obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    obs.encounter_id = encounter.id
    obs.obs_datetime = date_used.to_date.strftime('%Y-%m-%d 00:00:00') rescue encounter.date_created
    obs.date_created = Time.now()
    obs.creator = encounter.creator
    obs.save

    obs = Observation.new()
    obs.person_id = encounter.patient_id
    obs.concept_id = Good_concept.id
    obs.value_numeric = films_used
    obs.obs_group_id = film_size.id
    obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
    obs.encounter_id = encounter.id
    obs.obs_datetime = date_used.to_date.strftime('%Y-%m-%d 00:00:00') rescue encounter.date_created
    obs.date_created = Time.now()
    obs.creator = encounter.creator
    obs.save
  end
  
   
  def radiology_encounter(encounter_type,creator,patient,encounter_datetime) 
    type = Films_encounter if encounter_type == 'Films'
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

  def create_investigation_obs(encounter,amount,receipt_num,paying,order,examination,referred_from)

    unless examination.blank?
      obs = Observation.new()
      obs.person_id = encounter.patient_id
      obs.concept_id = examination.first
      obs.creator = encounter.creator
      obs.value_coded = examination.last
      obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      obs.encounter_id = encounter.id
      obs.obs_datetime = encounter.date_created
      obs.date_created = Time.now()
      obs.creator = encounter.creator
      obs.save
    end

    unless referred_from.blank?
      obs = Observation.new()
      obs.person_id = encounter.patient_id
      obs.concept_id = Referred_from_concept.id
      obs.creator = encounter.creator
      obs.value_text = referred_from
      obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      obs.encounter_id = encounter.id
      obs.obs_datetime = encounter.date_created
      obs.date_created = Time.now()
      obs.creator = encounter.creator
      obs.save
    end


    unless amount.blank?
      obs = Observation.new()
      obs.person_id = encounter.patient_id
      obs.concept_id = Amount_concept.id
      obs.creator = encounter.creator
      obs.value_numeric = amount.to_f
      obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      obs.encounter_id = encounter.id
      #obs.order_id = order.id
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
      #obs.order_id = order.id
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
      #obs.order_id = order.id
      obs.obs_datetime = encounter.date_created
      obs.date_created = Time.now()
      obs.creator = encounter.creator
      obs.save
    end

    unless amount.blank?
      obs = Observation.new()
      obs.person_id = encounter.patient_id
      obs.concept_id = Payment_type_concept.id
      obs.value_coded = Cash_concept.id
      obs.uuid = ActiveRecord::Base.connection.select_one("SELECT UUID() as uuid")['uuid']
      obs.encounter_id = encounter.id
      #obs.order_id = order.id
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

  def migrated?(first_generation,second_generation)
    type = PatientIdentifierType.where(:'name' => 'National ID').first
    first_generation_without_dashes = first_generation.gsub('-','') unless first_generation.blank?
    PatientIdentifier.where('(identifier = ? OR identifier = ? OR identifier = ?) AND
      identifier_type = ?',first_generation,first_generation_without_dashes,
      second_generation,type.id).blank? != true 
  end
  
  def radiology_old_concept(concept_name)
    case concept_name.upcase
      when 'ABDOMEN'
        [Abdomen.id]
      when 'CHEST'
        [Chest.id]
      when 'COLOUR DOPPLER ARTERIES'
        [PeritheralArterialandVenousDuplex.id]
      when 'ECHOCARDIOGRAPHY'
        [Echocardiography.id] #U/S - Echocardiography
      when 'HEAD'
        [NeonatalBrain.id] #Head
      when 'NECK'
        [ThyroidandParathyroidGlands.id] #U/S - Neck
      when 'OBSTETRICS'
        [Obstetrics.id] #U/S - Obstetrics
      when 'PELVIS'
        [Pelvis.id] #U/S - Pelvis
      when 'POWER DOPPLER'
        [PowerDoppler.id] #U/S - Power Doppler
      when 'SMALL PART'
        [SmallPart.id] #U/S - Small part
      when 'THORAX'
        #----------- Thorax = ConceptName.find_by_name('Thorax') #U/S - Thorax
        [Thorax.id] #U/S - Thorax
      when 'C-SPINE'
        [Spine.id,Cervical.id] #Xray - C-spine .. Note under concept spine
      when 'CONTRAST GI STUDY'
        [ContrastGIstudy.id] #Xray - Contrast GI study
      when 'CONTRAST UT STUDY'
        [ContrastUTstudy.id] #Xray - Contrast UT study
      when 'FACIAL BONES'
        [Skull.id,FacialBones.id] #Xray - Facial bones Note it is under concept Skull
      when 'HSG'
        [HSG.id] #Xray - HSG
      when 'L-SPINE'
        [Spine.id,Lumbar.id] #Xray - L-spine: Note its under Spine
      when 'T-SPINE'
        [Spine.id,Thoracic.id] #Xray - T-spine
      when 'LEFT ANKLE JOINT'
        [LowerLimb.id,LeftAnkleJoint.id] #Left Ankle joint: under Lower Limb
      when 'LEFT ELBOW'
        [UpperLimb.id,LeftElbow.id] #Xray - Left Elbow: under Upper Limb
      when 'LEFT FEMUR'
        [LowerLimb.id,LeftFemur.id] #Xray - Left Femur: under Lower Limb
      when 'LEFT FINGERS'
        [UpperLimb.id,LeftFingers.id] #Xray - LEFT FINGERS: under Upper Limb
      when 'LEFT FOOT'
        [LowerLimb.id,LeftFoot.id] #Xray - Left Foot: under Lower Limb
      when 'LEFT HAND'
        [UpperLimb.id,LeftHand.id] #Xray - Left Hand: under Upper Limb
      when 'LEFT HIP JOINT'
        [LowerLimb.id,LeftHipJoint.id] #Xray - LEFT HIP JOINT: under Lower Limb
      when 'LEFT HUMERUS'
        [UpperLimb.id,LeftHumerus.id] #Xray - Left Humerus: under Upper Limb
      when 'LEFT KNEE'
        [LowerLimb.id,LeftKneeJoint.id] #Xray - Left Knee: under Lower Limb
      when 'LEFT FOREARM'
        [UpperLimb.id,LeftForearm.id] #Xray - Left Forearm under Upper Limb
      when 'LEFT SHOULDER'
        [UpperLimb.id,LeftShoulder.id] #Xray - Left Shoulder under Upper Limb
      when 'LEFT TIBIA/FIBULA'
        [LowerLimb.id,LeftLeg.id] #Xray - Left Tibia/Fibula under Lower Limb
      when 'LEFT TOES'
        [LowerLimb.id,LeftToes.id] #Xray - Left Toes under Lower Limb
      when 'LEFT WRIST'
        [UpperLimb.id,LeftWrist.id] #Xray - Left Wrist under Upper Limb
      when 'RIGHT ANKLE JOINT'
        [LowerLimb.id,RightAnkleJoint.id] #RIGHT Ankle joint: under Lower Limb
      when 'RIGHT ELBOW'
        [UpperLimb.id,RightElbow.id] #Xray - RIGHT Elbow: under Upper Limb
      when 'RIGHT FEMUR'
        [LowerLimb.id,RightFemur.id] #Xray - RIGHT Femur: under Lower Limb
      when 'RIGHT FINGERS'
        [UpperLimb.id,RightFingers.id] #Xray - RIGHT FINGERS: under Upper Limb
      when 'RIGHT FOOT'
        [LowerLimb.id,RightFoot.id] #Xray - RIGHT Foot: under Lower Limb
      when 'RIGHT HAND'
        [UpperLimb.id,RightHand.id] #Xray - RIGHT Hand: under Upper Limb
      when 'RIGHT HIP JOINT'
        [LowerLimb.id,RightHipJoint.id] #Xray - RIGHT HIP JOINT: under Lower Limb
      when 'RIGHT HUMERUS'
        [UpperLimb,RightHumerus.id] #Xray - RIGHT Humerus: under Upper Limb
      when 'RIGHT KNEE'
        [LowerLimb.id,RightKneeJoint.id] #Xray - RIGHT Knee: under Lower Limb
      when 'RIGHT FOREARM'
        [UpperLimb.id,RightForearm.id] #Xray - RIGHT Forearm under Upper Limb
      when 'RIGHT SHOULDER'
        [UpperLimb.id,RightShoulder.id] #Xray - RIGHT Shoulder under Upper Limb
      when 'RIGHT TIBIA/FIBULA'
        [LowerLimb.id,RightLeg.id] #Xray - RIGHT Tibia/Fibula under Lower Limb
      when 'RIGHT TOES'
        [LowerLimb.id,RightToes.id] #Xray - RIGHT Toes under Lower Limb
      when 'RIGHT WRIST'
        [UpperLimb.id,RightWrist.id] #Xray - RIGHT Wrist under Upper Limb
      when 'SHOULDER'
        [Shoulder.id] #Xray - Shoulder under Upper Limb
      when 'SKULL'
        [Skull.id] #Xray - Skull under Upper Limb
      when 'UPPER LIMB'
        [UpperLimb.id] #Xray - Upper limb
      when 'LOWER LIMB'
        [LowerLimb.id] #Xray - Lower limb
      else
        [Other_concept.id]
  end

  #migrated_users
  migrated_patient_demographics
  #migrated_radiology_study_data
