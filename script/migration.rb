  require 'lib/bantu_soundex'


  def migrated_users
    users = Clinician.all
    count = users.length
    migrated_count = 0

    puts "Migrating #{count} users' record(s) ........."  
    sleep(5)

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

  end

  def migrated_patient_demographics
    patients = MasterPatientRecord.all #(:limit => 100)
    count = patients.length
    migrated_count = 0

    puts "Migrating #{count} patients' record(s) ........."  
    sleep(5)

    (patients || []).each do |pat|
      given_name = pat.try(:First_Name).capitalize rescue nil
      family_name = pat.try(:Last_Name).capitalize rescue nil
      gender = pat.try(:Sex)
      day_of_birth = pat.try(:Day_Of_Birth)
      month_of_birth = pat.try(:Month_Of_Birth)
      year_of_birth = pat.try(:Year_Of_Birth)

      birthdate_estimated = birthdate_calculations(year_of_birth, month_of_birth, day_of_birth)

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
    end                                                                       
                                                                                
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
    i.location_id = 700
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
  
  migrated_users


  migrated_patient_demographics
