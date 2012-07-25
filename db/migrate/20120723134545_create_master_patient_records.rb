class CreateMasterPatientRecords < ActiveRecord::Migration
  def change
    create_table :master_patient_records do |t|

      t.timestamps
    end
  end
end
