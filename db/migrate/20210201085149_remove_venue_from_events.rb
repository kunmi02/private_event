class RemoveVenueFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :venue, :string
  end
end
