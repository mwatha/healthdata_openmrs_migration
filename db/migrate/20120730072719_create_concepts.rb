class CreateConcepts < ActiveRecord::Migration
  def change
    create_table :concepts do |t|

      t.timestamps
    end
  end
end
