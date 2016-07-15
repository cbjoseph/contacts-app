class AddLatitudeToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :latitue, :float
  end
end
