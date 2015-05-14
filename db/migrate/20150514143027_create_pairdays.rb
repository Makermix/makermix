class CreatePairdays < ActiveRecord::Migration
  def change
    create_table :pairdays do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
