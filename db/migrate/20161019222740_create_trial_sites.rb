class CreateTrialSites < ActiveRecord::Migration
  def change
    create_table :trial_sites do |t|
      t.string :site_name
      t.string :site_city
      t.string :site_state
      t.integer :site_zip
      t.string :site_county
      t.string :site_status

      t.timestamps null: false
    end
  end
end
