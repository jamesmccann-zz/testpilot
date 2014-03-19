class AddBuildTokenToApps < ActiveRecord::Migration
  def up
    add_column :apps, :build_token, :string, index: true

    App.where(build_token: nil).find_each do |app|
      app.regenerate_build_token!
    end

    change_column :apps, :build_token, :string, null: false, unique: true
  end

  def down
    remove_column :apps, :build_token
  end
end
