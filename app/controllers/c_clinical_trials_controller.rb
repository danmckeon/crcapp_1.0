class CClinicalTrialsController < ApplicationController
  before_action :set_c_clinical_trial, only: [:show, :edit, :update, :destroy]

  # GET /c_clinical_trials
  # GET /c_clinical_trials.json
  def index
    # @cct_scrape = CClinicalTrial.new
    # @cct_scrape.scrape_clinical_trials
    # Not sure about params below
    @c_clinical_trials = CClinicalTrial.all # CClinicalTrial.paginate(page: params[:page]) UNCOMMENT WHEN WANT TO PAGINATE
    respond_to do |format|
      format.html
      format.csv { send_data @c_clinical_trials.to_csv }
      format.xls { send_data @c_clinical_trials.to_csv(col_sep: "\t") }
    end
  end

  # GET /c_clinical_trials/1
  # GET /c_clinical_trials/1.json
  def show
  end

  # GET /c_clinical_trials/new
  def new
    @c_clinical_trial = CClinicalTrial.new
  end

  # GET /c_clinical_trials/1/edit
  def edit
  end

  # POST /c_clinical_trials
  # POST /c_clinical_trials.json
  def create
    @c_clinical_trial = CClinicalTrial.new(c_clinical_trial_params)

    respond_to do |format|
      if @c_clinical_trial.save
        format.html { redirect_to @c_clinical_trial, notice: 'C clinical trial was successfully created.' }
        format.json { render :show, status: :created, location: @c_clinical_trial }
      else
        format.html { render :new }
        format.json { render json: @c_clinical_trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /c_clinical_trials/1
  # PATCH/PUT /c_clinical_trials/1.json
  def update
    respond_to do |format|
      if @c_clinical_trial.update(c_clinical_trial_params)
        format.html { redirect_to @c_clinical_trial, notice: 'C clinical trial was successfully updated.' }
        format.json { render :show, status: :ok, location: @c_clinical_trial }
      else
        format.html { render :edit }
        format.json { render json: @c_clinical_trial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /c_clinical_trials/1
  # DELETE /c_clinical_trials/1.json
  def destroy
    @c_clinical_trial.destroy
    respond_to do |format|
      format.html { redirect_to c_clinical_trials_url, notice: 'C clinical trial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_c_clinical_trial
      @c_clinical_trial = CClinicalTrial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def c_clinical_trial_params
      params.require(:c_clinical_trial).permit(:org_study_id, :secondary_id, :nct_id, :nct_alias, :brief_title, :official_title, :lead_sponsor_name, :lead_sponsor_class, :brief_summary, :detailed_description, :overall_status, :start_date, :phase, :study_type, :study_design, :primary_outcome_measure, :primary_outcome_time_frame, :primary_outcome_safety_issue, :secondary_outcome_measure, :secondary_outcome_time_frame, :secondary_outcome_safety_issue, :number_of_groups, :enrollment_type, :enrollment_number, :condition, :arm_group_label, :arm_group_description, :biospec_description, :eligibility, :sampling_method, :criteria, :gender, :minimum_age, :maximum_age, :healthy_volunteers, :overall_official_name, :overall_official_role, :overall_official_affiliation, :overall_contact_name, :overall_contact_phone, :overall_contact_email, :overall_contact_backup_name, :overall_contact_backup_phone, :overall_contact_backup_email, :location_name, :location_city, :location_state, :location_zip, :location_country, :results_reference_citation, :results_reference_PMID, :verification_date, :lastchanged_date, :firstreceived_date, :responsible_party_type, :keyword, :is_fda_regulated, :has_expanded_access, :condition_browse_mesh_term)
    end
end
