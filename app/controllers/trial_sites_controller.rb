class TrialSitesController < ApplicationController
  before_action :set_trial_site, only: [:show, :edit, :update, :destroy]

  # GET /trial_sites
  # GET /trial_sites.json
  def index
    @trial_sites = TrialSite.all
    respond_to do |format|
      format.html
      format.csv { send_data @trial_sites.to_csv }
      format.xls { send_data @trial_sites.to_csv(col_sep: "\t") }
    end
  end

  # GET /trial_sites/1
  # GET /trial_sites/1.json
  def show
  end

  # GET /trial_sites/new
  def new
    @trial_site = TrialSite.new
  end

  # GET /trial_sites/1/edit
  def edit
  end

  # POST /trial_sites
  # POST /trial_sites.json
  def create
    @trial_site = TrialSite.new(trial_site_params)

    respond_to do |format|
      if @trial_site.save
        format.html { redirect_to @trial_site, notice: 'Trial site was successfully created.' }
        format.json { render :show, status: :created, location: @trial_site }
      else
        format.html { render :new }
        format.json { render json: @trial_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trial_sites/1
  # PATCH/PUT /trial_sites/1.json
  def update
    respond_to do |format|
      if @trial_site.update(trial_site_params)
        format.html { redirect_to @trial_site, notice: 'Trial site was successfully updated.' }
        format.json { render :show, status: :ok, location: @trial_site }
      else
        format.html { render :edit }
        format.json { render json: @trial_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trial_sites/1
  # DELETE /trial_sites/1.json
  def destroy
    @trial_site.destroy
    respond_to do |format|
      format.html { redirect_to trial_sites_url, notice: 'Trial site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trial_site
      @trial_site = TrialSite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trial_site_params
      params.require(:trial_site).permit(:site_name, :site_city, :site_state, :site_zip, :site_county, :site_status)
    end
end
