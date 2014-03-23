class Build < ActiveRecord::Base

  belongs_to :app

  before_validation :set_build_number
  mount_uploader :apk, APKUploader

  delegate :name, to: :app, prefix: "app", allow_nil: true

  validates :number, presence: true
  validates :apk, presence: true

  default_scope order('number DESC')

  private

  def set_build_number
    self.number ||= (app.builds.count rescue 0) + 1
  end

end
