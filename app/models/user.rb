class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :trackable,
         :lockable,
         :validatable,
         :confirmable

  has_many :assignments
  has_many :apps, through: :assignments
end
