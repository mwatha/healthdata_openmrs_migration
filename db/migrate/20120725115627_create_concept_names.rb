class CreateConceptNames < ActiveRecord::Migration
  def change
    create_table :concept_names do |t|

      t.timestamps
    end
  end
end
