class AddContactColumnsToCClinicalTrials < ActiveRecord::Migration
  def change
  	add_column :c_clinical_trials, :overall_official, :string
  	add_column :c_clinical_trials, :contact, :string
  	add_column :c_clinical_trials, :contact_backup, :string
  	add_column :c_clinical_trials, :overall_contact, :string
  	add_column :c_clinical_trials, :overall_contact_backup, :string
  end
end
