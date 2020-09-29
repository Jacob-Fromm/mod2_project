class AddParkCodeToParksTable < ActiveRecord::Migration[6.0]
  def change
    add_column :parks, :park_code, :string
  end
end
