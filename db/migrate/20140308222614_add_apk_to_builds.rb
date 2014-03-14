class AddApkToBuilds < ActiveRecord::Migration
  def change
    add_column :builds, :apk, :string
  end
end
