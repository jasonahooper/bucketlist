class AddTravellerToDestination < ActiveRecord::Migration
  def change
    add_column :destinations, :traveller_id, :integer
  end
end
