require "selenium-webdriver"

module Popart
  class SeleniumSession

    attr_reader :driver

    def un
      ENV["SAUCE_USERNAME"]
    end

    def pw
      ENV["SAUCE_ACCESS_KEY"]
    end

    def auth
      "#{un}:#{pw}"
    end

    def server
      "ondemand.saucelabs.com"
    end

    def port
      80
    end

    def endpoint
      "http://#{auth}@#{server}:#{port}/wd/hub"
    end

    def initialize desired_capabilities
      @driver = Selenium::WebDriver.for :remote, :url => endpoint,  :desired_capabilities => desired_capabilities

      at_exit do
        if @driver
          begin
            @driver.quit
          rescue
            #Not relevant anymore
          end
        end
      end
    end

    def method_missing m, *args
      if !args.empty?
        @driver.send(m, *args)
      else
        @driver.send(m)
      end
    end
  end
end