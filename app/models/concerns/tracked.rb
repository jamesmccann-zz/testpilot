module Tracked
  extend ActiveSupport::Concern

  included do
    include PublicActivity::Model
    tracked owner: Proc.new{ |controller, model| controller.current_user }
  end

end