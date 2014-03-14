class Build < ActiveRecord::Base
  
  belongs_to :app

  before_validation :set_build_number
  mount_uploader :apk, APKUploader

  delegate :name, to: :app, prefix: "app"

  validates :number, presence: true
  validates :apk, presence: true
  validates :app, presence: true

  private

  def set_build_number
    return if self.number
    return unless app
    self.number = app.builds.count+1
    self.save
  end

end
