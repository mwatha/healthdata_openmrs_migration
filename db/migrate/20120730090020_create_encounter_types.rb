class CreateEncounterTypes < ActiveRecord::Migration
  def change
    create_table :encounter_types do |t|

      t.timestamps
    end
  end
end
