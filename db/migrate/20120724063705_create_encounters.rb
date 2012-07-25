class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|

      t.timestamps
    end
  end
end
