class CreateRadiologyStudies < ActiveRecord::Migration
  def change
    create_table :radiology_studies do |t|

      t.timestamps
    end
  end
end
