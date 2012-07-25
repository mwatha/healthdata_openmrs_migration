class CreateClinicians < ActiveRecord::Migration
  def change
    create_table :clinicians do |t|

      t.timestamps
    end
  end
end
