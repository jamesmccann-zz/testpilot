class Assignment < ActiveRecord::Base
  cattr_reader :default_role
  @@default_role = "tester"

  belongs_to :app
  belongs_to :user

  validates :app,
            :user,
            :role,
            presence: true

  validates [:app_id, :user_id],
            uniqueness: true

end
