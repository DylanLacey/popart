require "parallel"
require "selenium/webdriver"

module Popart
	class DoTheThing

  attr_accessor :url, :number_of_threads

	def initialize url, number_of_threads
    @url = url
    @number_of_threads = number_of_threads



    filedatas = Parallel.map(browsers, :in_threads => number_of_threads) do |browser|
      
    end 
	end
end