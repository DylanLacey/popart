require "popart/version"
require "popart/config"
require "popart/browser"
require "popart/worker"
require "thread"

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

    def thread_things directory, &actions
      threadcount = @config.thread_count
      lock = Mutex.new

      threads = []
      threadcount.times do |t|
        puts "Thread #{t}"
        threads << Thread.new do
          w = Popart::Worker.new @browsers, lock
          w.perform do |browser|
            screenshot = browser.perform &actions

            File.open((File.join directory, browser.filename), 'w') do |file|
              file.write screenshot
            end
          end
        end
      end

      threads.map(&:join)
    end
  end
end