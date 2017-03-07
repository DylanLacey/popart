require_relative "selenium_session"

module Popart
  class Browser
    attr_reader :capabilities

    def initialize capabilities
      @capabilities = capabilities
    end

    def perform &block
      unless @browser
        @browser = SeleniumSession.new capabilities

        begin
          yield @browser
        rescue
          ## TODO SOMETHING LESS CRAP HERE
        end
      end
    end
  end
end