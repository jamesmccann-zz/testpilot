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

  # Public: Ensure a user is present by either finding one or creating
  # a user via an invitation.
  #
  # email - The email address to find or invite a user by
  #
  # Returns a user instance
  def self.find_or_invite(email)
    User.where(email: email).first || User.invite!(email: email)
  end
end
