class CreatePersonNames < ActiveRecord::Migration
  def change
    create_table :person_names do |t|

      t.timestamps
    end
  end
end
