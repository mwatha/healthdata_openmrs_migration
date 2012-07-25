class CreatePatientIdentifierTypes < ActiveRecord::Migration
  def change
    create_table :patient_identifier_types do |t|

      t.timestamps
    end
  end
end
