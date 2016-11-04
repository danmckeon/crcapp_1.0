class AddLocationStatusToCClinicalTrials < ActiveRecord::Migration
  def change
    add_column :c_clinical_trials, :location_status, :string
  end
end
