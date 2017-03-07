require "popart/version"
require "popart/config"
require "popart/browser"

module Popart
  class << self
    def configuration
      @config ||= self.configure
    end

    def configure
      @config = Popart::Config.new
      @config.initial_config

      @browsers = @config.browsers.map { |b| Popart::Browser.new b }
    end

    def save_screenshots directory, &actions
      @browsers.each do |browser|
        screenshot = browser.perform &actions

        File.open((File.join directory, browser.filename), 'w') do |file|
          file.write screenshot
        end
      end
    end
  end
end