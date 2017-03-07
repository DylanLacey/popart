module Popart
  class Worker
    def initialize browsers, lock
      @browsers = browsers
      @lock = lock
      @work_remains = true
    end

    def perform &action
      while @work_remains
        browser = @lock.synchronize { @browsers.shift }
        if browser
          yield browser
          browser.cleanup
        else
          @work_remains = false
        end
      end
    end
  end
end