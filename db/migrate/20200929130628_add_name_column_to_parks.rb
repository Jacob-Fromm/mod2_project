class AddNameColumnToParks < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :park_name, :string
  end
end
