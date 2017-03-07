require "pathname"
require "yaml"

module Popart
  class Config

    attr_accessor :browsers, :output_directory, :site, :thread_count

    def default_browsers
      [
        {"browserName" => 'Chrome', "platform" => "Windows 10", "version" => "latest"},
        {"browserName" => 'Firefox', "platform" => "Windows 10", "version" => "latest"}
      ]
    end

    def default_output_directory
      './screenshots'
    end

    def default_thread_count
      5
    end
    
    def initial_config
      fn = ARGV[1] ||= './config.json'
      path = Pathname.new fn

      load_from_file path if path.exist?

      set_defaults
    end

    def load_from_file filename
      filedata = File.read filename
      config_hash = YAML.load(filedata)

      @browsers = [config_hash["browsers"]].flatten
      @output_directory = config_hash["output_directory"]
      @site = config_hash["site"]
      @thread_count = config_hash["thread_count"]
    end

    def set_defaults
      @browsers ||= default_browsers
      @output_directory ||= default_output_directory
      @thread_count ||= default_thread_count
      set_site(@site ||= ARGV[0])

      @output_directory = Pathname.new @output_directory

      verify_output_directory
    end

    def set_site site
      unless site
        STDERR.puts "You must provide a site to screenshot."
        exit
      end

      @site = URI site
    end


    def verify_output_directory
      unless @output_directory.exist?
        STDERR.puts "#{@output_directory} doesn't seem to exist; creating it."
        Dir.mkdir @output_directory
      end
    end
  end
end