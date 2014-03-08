class App < ActiveRecord::Base

  has_many :builds

  validates :name, presence: true

end
