module JSONDefault
  extend ActiveSupport::Concern

  included do
    before_action :set_default_format, :assert_valid_format!
  end

  private

    # Private: Ensure that the format is set if none is provided.
    #
    # Examples:
    #
    #   request format is JSON -> request format remains JSON
    #   request format is not set -> request format becomes JSON
    #   request format is XML -> request.format remains XML
    #
    # Returns the new request format
    def set_default_format
      request.format = 'json' unless params.key?(:format)
    end

    # Private: Assert that the format is set to JSON.
    #
    # If it is not, this will respond with a 406 Not Acceptable
    def assert_valid_format!
      raise ActionController::UnknownFormat unless request.format == 'json'
    end
end
