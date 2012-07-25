class CreateFilmsUseds < ActiveRecord::Migration
  def change
    create_table :films_useds do |t|

      t.timestamps
    end
  end
end
