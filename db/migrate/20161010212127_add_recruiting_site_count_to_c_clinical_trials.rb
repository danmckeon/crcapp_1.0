class AddRecruitingSiteCountToCClinicalTrials < ActiveRecord::Migration
  def change
    add_column :c_clinical_trials, :recruiting_site_count, :integer
  end
end
