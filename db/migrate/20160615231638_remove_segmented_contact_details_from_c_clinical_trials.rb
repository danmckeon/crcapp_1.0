class RemoveSegmentedContactDetailsFromCClinicalTrials < ActiveRecord::Migration
  def change
  	remove_column :c_clinical_trials, :overall_official_name
  	remove_column :c_clinical_trials, :overall_official_role
  	remove_column :c_clinical_trials, :overall_official_affiliation
  	remove_column :c_clinical_trials, :overall_contact_name
  	remove_column :c_clinical_trials, :overall_contact_phone
  	remove_column :c_clinical_trials, :overall_contact_email
  	remove_column :c_clinical_trials, :overall_contact_backup_name
  	remove_column :c_clinical_trials, :overall_contact_backup_phone
  	remove_column :c_clinical_trials, :overall_contact_backup_email
  end
end
