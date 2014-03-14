class TestpilotController < ApplicationController

  def show
    # Let the fun begin!
    @apps = App.all
  end

end
