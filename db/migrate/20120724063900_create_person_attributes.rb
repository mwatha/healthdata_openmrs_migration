class CreatePersonAttributes < ActiveRecord::Migration
  def change
    create_table :person_attributes do |t|

      t.timestamps
    end
  end
end
