class CreatePatientIdentifiers < ActiveRecord::Migration
  def change
    create_table :patient_identifiers do |t|

      t.timestamps
    end
  end
end
