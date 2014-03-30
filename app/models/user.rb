class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable,
         :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :lockable,
         :validatable,
         :confirmable,
         :registerable # Registrations are disabled via routes

  validates :full_name, presence: true

  has_many :assignments
  has_many :apps, through: :assignments
end
