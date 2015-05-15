class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.integer :first_person_id
      t.integer :second_person_id

      t.timestamps null: false
    end
  end
end
