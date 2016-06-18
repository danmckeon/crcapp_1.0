class AddAgeIntegerColumnsToCClinicalTrials < ActiveRecord::Migration
  def change
  	add_column :c_clinical_trials, :age_minimum_int, :integer 
  	add_column :c_clinical_trials, :age_maximum_int, :integer 
  end
end
