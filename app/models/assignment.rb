class Assignment < ActiveRecord::Base

  belongs_to :app
  belongs_to :user

  validates :app_id,
            :user_id,
            presence: true

  validates :developer, inclusion: {in: [true, false]}

  validates :app_id, uniqueness: {scope: :user_id}

end
