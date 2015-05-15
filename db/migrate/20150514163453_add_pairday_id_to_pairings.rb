class AddPairdayIdToPairings < ActiveRecord::Migration
  def change
    add_column :pairings, :pairday_id, :integer
  end
end
