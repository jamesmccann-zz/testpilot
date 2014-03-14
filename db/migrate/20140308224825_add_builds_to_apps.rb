class AddBuildsToApps < ActiveRecord::Migration
  def change
    add_column :builds, :app_id, :integer, :index => true
  end
end
