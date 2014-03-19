class AddReleaseNotesToBuild < ActiveRecord::Migration
  def change
    add_column :builds, :release_notes, :text
  end
end
