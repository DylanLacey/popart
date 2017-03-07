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

          # TODO SOMETHING LESS CRAP HERE
        end
      end
    end

    def filename
      filename = capabilities["browserName"] + '_' + capabilities["version"] + '_' + capabilities["platform"] + '.png'
      filename.gsub! " ", "-"

      filename
    end

    def cleanup
      @browser.quit if @browser
    rescue
    ensure
      @browser = nil
    end
  end
end