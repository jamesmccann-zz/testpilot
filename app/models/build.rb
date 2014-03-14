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
    self.number ||= (app.builds.count rescue 0) + 1
  end

end
