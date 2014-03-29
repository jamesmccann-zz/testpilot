class App < ActiveRecord::Base

  cattr_reader :build_token_length
  @@build_token_length = 16

  has_many :builds

  validates :name, presence: true
  validates :build_token, presence: true, uniqueness: true
  before_validation :assign_build_token, on: :create

  mount_uploader :icon, ApplicationIconUploader

  def latest_build
    builds.last
  end

  def regenerate_build_token!
    update!(build_token: generate_build_token)
  end

  def to_param
    [id, name].join(' ').parameterize
  end

  private

    def generate_build_token
     Devise.friendly_token[0..@@build_token_length - 1]
    end

    def assign_build_token
      self.build_token = generate_build_token
    end

end
