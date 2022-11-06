# frozen_string_literal: true

require_relative 'rings/version'
require_relative 'rings/config'
require 'thor'
require 'yaml'

module Rings
  class Error < StandardError; end

  class CLI < Thor
    class_option :config, aliases: :c, default: '', type: :string, desc: 'Set configration file'

    desc 'new', 'Generate New Project'
    def new
      puts 'New mode'
      path = options.config
      path = "#{Dir.home}/.config/rings/default.yaml" if options.config == ''
      if File.exist? path
        puts "exist #{path}"
      else
        puts "Create a default config in #{path}"
        base_path = Rings::DEFAULT_CONFIG[:base_path]
        if File.exist? base_path
          puts "Found #{base_path} dir for base-path"
        else
          puts "Create a base-path in #{base_path}"
        end
      end
      puts Rings::DEFAULT_CONFIG.to_yaml
    end

    desc 'list', 'Show Projects list'
    def list
      puts 'List mode'
    end

    desc 'version', 'Show version.'
    def version
      puts "rings #{Rings::VERSION}"
    end

    def self.exit_on_failure?
      true
    end
  end
end
