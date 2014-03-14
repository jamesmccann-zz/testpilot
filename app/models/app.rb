class App < ActiveRecord::Base

  has_many :builds

  validates :name, presence: true

  def latest_build
    builds.last
  end

end
