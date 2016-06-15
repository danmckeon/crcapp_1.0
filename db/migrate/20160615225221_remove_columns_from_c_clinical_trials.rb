class RemoveColumnsFromCClinicalTrials < ActiveRecord::Migration
  def change
  	remove_column :c_clinical_trials, :biospec_description
  end
end
