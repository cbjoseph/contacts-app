class ChangeNameOfLatitude < ActiveRecord::Migration
  def change
    rename_column :contacts, :latitue, :latitude
  end
end
