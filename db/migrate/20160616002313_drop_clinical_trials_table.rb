class DropClinicalTrialsTable < ActiveRecord::Migration
  def change
  	drop_table :clinical_trials
  end
end
