class CreatePersonAddresses < ActiveRecord::Migration
  def change
    create_table :person_addresses do |t|

      t.timestamps
    end
  end
end
