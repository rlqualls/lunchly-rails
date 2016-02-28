class AddLastVisitedToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :last_visited, :datetime
  end
end
