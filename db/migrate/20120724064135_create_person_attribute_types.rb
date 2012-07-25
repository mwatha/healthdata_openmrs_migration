class CreatePersonAttributeTypes < ActiveRecord::Migration
  def change
    create_table :person_attribute_types do |t|

      t.timestamps
    end
  end
end
