require 'test_helper'

class TrialSitesControllerTest < ActionController::TestCase
  setup do
    @trial_site = trial_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trial_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trial_site" do
    assert_difference('TrialSite.count') do
      post :create, trial_site: { site_city: @trial_site.site_city, site_county: @trial_site.site_county, site_name: @trial_site.site_name, site_state: @trial_site.site_state, site_status: @trial_site.site_status, site_zip: @trial_site.site_zip }
    end

    assert_redirected_to trial_site_path(assigns(:trial_site))
  end

  test "should show trial_site" do
    get :show, id: @trial_site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trial_site
    assert_response :success
  end

  test "should update trial_site" do
    patch :update, id: @trial_site, trial_site: { site_city: @trial_site.site_city, site_county: @trial_site.site_county, site_name: @trial_site.site_name, site_state: @trial_site.site_state, site_status: @trial_site.site_status, site_zip: @trial_site.site_zip }
    assert_redirected_to trial_site_path(assigns(:trial_site))
  end

  test "should destroy trial_site" do
    assert_difference('TrialSite.count', -1) do
      delete :destroy, id: @trial_site
    end

    assert_redirected_to trial_sites_path
  end
end
