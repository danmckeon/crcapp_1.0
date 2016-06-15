class RemoveEnrollmentTypeFromCClinicalTrials < ActiveRecord::Migration
  def change
  	remove_column :c_clinical_trials, :enrollment_type
  end
end
