class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
