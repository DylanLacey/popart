require "pathname"

module Popart
  class Config

    attr_accessor :browsers, :output_directory, :site

    def default_browsers
      [
        {:browserName => 'Chrome', :platform => "Windows 10", :version => "latest"},
        {:browserName => 'Firefox', :platform => "Windows 10", :version => "latest"}
      ]
    end

    def default_output_directory
      './screenshots'
    end
    
    def initial_config
      fn = ARGV[1] ||= './config.json'
      path = Pathname.new fn

      load_from_file path if path.exist?

      set_defaults
    end

    def load_from_file filename
      config_hash = YAML.parse filename

      @browsers = [config_hash[:browsers]].flatten
      @output_directory = config_hash[:output_directory]
      @site = config_hash[:site]
    end

    def set_defaults
      @browsers ||= default_browsers
      @output_directory ||= default_output_directory
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