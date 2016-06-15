class CreateClinicalTrials < ActiveRecord::Migration
  def change
    create_table :clinical_trials do |t|
      t.string :org_study_id
      t.string :secondary_id
      t.string :nct_id
      t.string :nct_alias
      t.string :brief_title
      t.string :official_title
      t.string :lead_sponsor_name
      t.string :lead_sponsor_class
      t.string :brief_summary
      t.string :detailed_description
      t.string :overall_status
      t.string :start_date
      t.string :phase
      t.string :study_type
      t.string :study_design
      t.string :primary_outcome_measure
      t.string :primary_outcome_time_frame
      t.string :primary_outcome_safety_issue
      t.string :secondary_outcome_measure
      t.string :secondary_outcome_time_frame
      t.string :secondary_outcome_safety_issue
      t.integer :number_of_groups
      t.string :enrollment_type
      t.integer :enrollment_number
      t.string :condition
      t.string :arm_group_label
      t.string :arm_group_description
      t.string :biospec_description
      t.string :eligibility
      t.string :sampling_method
      t.string :criteria
      t.string :gender
      t.string :minimum_age
      t.string :maximum_age
      t.string :healthy_volunteers
      t.string :overall_official_name
      t.string :overall_official_role
      t.string :overall_official_affiliation
      t.string :overall_contact_name
      t.string :overall_contact_phone
      t.string :overall_contact_email
      t.string :overall_contact_backup_name
      t.string :overall_contact_backup_phone
      t.string :overall_contact_backup_email
      t.string :location_name
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.string :location_country
      t.string :results_reference_citation
      t.integer :results_reference_PMID
      t.string :verification_date
      t.string :lastchanged_date
      t.string :firstreceived_date
      t.string :responsible_party_type
      t.string :keyword
      t.string :is_fda_regulated
      t.string :has_expanded_access
      t.string :condition_browse_mesh_term

      t.timestamps null: false
    end
  end
end
