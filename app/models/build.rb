class Build < ActiveRecord::Base
  
  belongs_to :app

  mount_uploader :apk, APKUploader

  delegates :name, to: app, prefix: "app"

end
