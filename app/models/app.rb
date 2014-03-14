class App < ActiveRecord::Base

  has_many :builds

  validates :name, presence: true

  def latest_build
    builds.last
  end

  def to_param
    @app.parameterize
  end

end
