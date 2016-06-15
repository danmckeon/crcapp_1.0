require 'test_helper'

class CClinicalTrialsControllerTest < ActionController::TestCase
  setup do
    @c_clinical_trial = c_clinical_trials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:c_clinical_trials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create c_clinical_trial" do
    assert_difference('CClinicalTrial.count') do
      post :create, c_clinical_trial: { arm_group_description: @c_clinical_trial.arm_group_description, arm_group_label: @c_clinical_trial.arm_group_label, biospec_description: @c_clinical_trial.biospec_description, brief_summary: @c_clinical_trial.brief_summary, brief_title: @c_clinical_trial.brief_title, condition: @c_clinical_trial.condition, condition_browse_mesh_term: @c_clinical_trial.condition_browse_mesh_term, criteria: @c_clinical_trial.criteria, detailed_description: @c_clinical_trial.detailed_description, eligibility: @c_clinical_trial.eligibility, enrollment_number: @c_clinical_trial.enrollment_number, enrollment_type: @c_clinical_trial.enrollment_type, firstreceived_date: @c_clinical_trial.firstreceived_date, gender: @c_clinical_trial.gender, has_expanded_access: @c_clinical_trial.has_expanded_access, healthy_volunteers: @c_clinical_trial.healthy_volunteers, is_fda_regulated: @c_clinical_trial.is_fda_regulated, keyword: @c_clinical_trial.keyword, lastchanged_date: @c_clinical_trial.lastchanged_date, lead_sponsor_class: @c_clinical_trial.lead_sponsor_class, lead_sponsor_name: @c_clinical_trial.lead_sponsor_name, location_city: @c_clinical_trial.location_city, location_country: @c_clinical_trial.location_country, location_name: @c_clinical_trial.location_name, location_state: @c_clinical_trial.location_state, location_zip: @c_clinical_trial.location_zip, maximum_age: @c_clinical_trial.maximum_age, minimum_age: @c_clinical_trial.minimum_age, nct_alias: @c_clinical_trial.nct_alias, nct_id: @c_clinical_trial.nct_id, number_of_groups: @c_clinical_trial.number_of_groups, official_title: @c_clinical_trial.official_title, org_study_id: @c_clinical_trial.org_study_id, overall_contact_backup_email: @c_clinical_trial.overall_contact_backup_email, overall_contact_backup_name: @c_clinical_trial.overall_contact_backup_name, overall_contact_backup_phone: @c_clinical_trial.overall_contact_backup_phone, overall_contact_email: @c_clinical_trial.overall_contact_email, overall_contact_name: @c_clinical_trial.overall_contact_name, overall_contact_phone: @c_clinical_trial.overall_contact_phone, overall_official_affiliation: @c_clinical_trial.overall_official_affiliation, overall_official_name: @c_clinical_trial.overall_official_name, overall_official_role: @c_clinical_trial.overall_official_role, overall_status: @c_clinical_trial.overall_status, phase: @c_clinical_trial.phase, primary_outcome_measure: @c_clinical_trial.primary_outcome_measure, primary_outcome_safety_issue: @c_clinical_trial.primary_outcome_safety_issue, primary_outcome_time_frame: @c_clinical_trial.primary_outcome_time_frame, responsible_party_type: @c_clinical_trial.responsible_party_type, results_reference_PMID: @c_clinical_trial.results_reference_PMID, results_reference_citation: @c_clinical_trial.results_reference_citation, sampling_method: @c_clinical_trial.sampling_method, secondary_id: @c_clinical_trial.secondary_id, secondary_outcome_measure: @c_clinical_trial.secondary_outcome_measure, secondary_outcome_safety_issue: @c_clinical_trial.secondary_outcome_safety_issue, secondary_outcome_time_frame: @c_clinical_trial.secondary_outcome_time_frame, start_date: @c_clinical_trial.start_date, study_design: @c_clinical_trial.study_design, study_type: @c_clinical_trial.study_type, verification_date: @c_clinical_trial.verification_date }
    end

    assert_redirected_to c_clinical_trial_path(assigns(:c_clinical_trial))
  end

  test "should show c_clinical_trial" do
    get :show, id: @c_clinical_trial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @c_clinical_trial
    assert_response :success
  end

  test "should update c_clinical_trial" do
    patch :update, id: @c_clinical_trial, c_clinical_trial: { arm_group_description: @c_clinical_trial.arm_group_description, arm_group_label: @c_clinical_trial.arm_group_label, biospec_description: @c_clinical_trial.biospec_description, brief_summary: @c_clinical_trial.brief_summary, brief_title: @c_clinical_trial.brief_title, condition: @c_clinical_trial.condition, condition_browse_mesh_term: @c_clinical_trial.condition_browse_mesh_term, criteria: @c_clinical_trial.criteria, detailed_description: @c_clinical_trial.detailed_description, eligibility: @c_clinical_trial.eligibility, enrollment_number: @c_clinical_trial.enrollment_number, enrollment_type: @c_clinical_trial.enrollment_type, firstreceived_date: @c_clinical_trial.firstreceived_date, gender: @c_clinical_trial.gender, has_expanded_access: @c_clinical_trial.has_expanded_access, healthy_volunteers: @c_clinical_trial.healthy_volunteers, is_fda_regulated: @c_clinical_trial.is_fda_regulated, keyword: @c_clinical_trial.keyword, lastchanged_date: @c_clinical_trial.lastchanged_date, lead_sponsor_class: @c_clinical_trial.lead_sponsor_class, lead_sponsor_name: @c_clinical_trial.lead_sponsor_name, location_city: @c_clinical_trial.location_city, location_country: @c_clinical_trial.location_country, location_name: @c_clinical_trial.location_name, location_state: @c_clinical_trial.location_state, location_zip: @c_clinical_trial.location_zip, maximum_age: @c_clinical_trial.maximum_age, minimum_age: @c_clinical_trial.minimum_age, nct_alias: @c_clinical_trial.nct_alias, nct_id: @c_clinical_trial.nct_id, number_of_groups: @c_clinical_trial.number_of_groups, official_title: @c_clinical_trial.official_title, org_study_id: @c_clinical_trial.org_study_id, overall_contact_backup_email: @c_clinical_trial.overall_contact_backup_email, overall_contact_backup_name: @c_clinical_trial.overall_contact_backup_name, overall_contact_backup_phone: @c_clinical_trial.overall_contact_backup_phone, overall_contact_email: @c_clinical_trial.overall_contact_email, overall_contact_name: @c_clinical_trial.overall_contact_name, overall_contact_phone: @c_clinical_trial.overall_contact_phone, overall_official_affiliation: @c_clinical_trial.overall_official_affiliation, overall_official_name: @c_clinical_trial.overall_official_name, overall_official_role: @c_clinical_trial.overall_official_role, overall_status: @c_clinical_trial.overall_status, phase: @c_clinical_trial.phase, primary_outcome_measure: @c_clinical_trial.primary_outcome_measure, primary_outcome_safety_issue: @c_clinical_trial.primary_outcome_safety_issue, primary_outcome_time_frame: @c_clinical_trial.primary_outcome_time_frame, responsible_party_type: @c_clinical_trial.responsible_party_type, results_reference_PMID: @c_clinical_trial.results_reference_PMID, results_reference_citation: @c_clinical_trial.results_reference_citation, sampling_method: @c_clinical_trial.sampling_method, secondary_id: @c_clinical_trial.secondary_id, secondary_outcome_measure: @c_clinical_trial.secondary_outcome_measure, secondary_outcome_safety_issue: @c_clinical_trial.secondary_outcome_safety_issue, secondary_outcome_time_frame: @c_clinical_trial.secondary_outcome_time_frame, start_date: @c_clinical_trial.start_date, study_design: @c_clinical_trial.study_design, study_type: @c_clinical_trial.study_type, verification_date: @c_clinical_trial.verification_date }
    assert_redirected_to c_clinical_trial_path(assigns(:c_clinical_trial))
  end

  test "should destroy c_clinical_trial" do
    assert_difference('CClinicalTrial.count', -1) do
      delete :destroy, id: @c_clinical_trial
    end

    assert_redirected_to c_clinical_trials_path
  end
end
